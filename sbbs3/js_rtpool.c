/* $Id: js_rtpool.c,v 1.31 2016/11/19 11:04:15 sbbs Exp $ */
// vi: tabstop=4

#include "js_rtpool.h"
#include <threadwrap.h>		/* Must be included after jsapi.h */
#include <genwrap.h>		/* SLEEP() */
#include <link_list.h>

#ifdef DLLCALL
#undef DLLCALL
#endif
#ifdef _WIN32
	#ifdef __BORLANDC__
		#define DLLCALL __stdcall
	#else
		#define DLLCALL
	#endif
#else	/* !_WIN32 */
	#define DLLCALL
#endif

static pthread_mutex_t		jsrt_mutex;
static int			initialized=0;
static link_list_t	rt_list;

#define TRIGGER_THREAD_STACK_SIZE       (256*1024)
static void trigger_thread(void *args)
{
	SetThreadName("sbbs/jsRTtrig");
	for(;;) {
		list_node_t *node;
		pthread_mutex_lock(&jsrt_mutex);
		for(node=listFirstNode(&rt_list); node; node=listNextNode(node))
			JS_TriggerAllOperationCallbacks(node->data);
		pthread_mutex_unlock(&jsrt_mutex);
		SLEEP(100);
	}
}

JSRuntime * DLLCALL jsrt_GetNew(int maxbytes, unsigned long timeout, const char *filename, long line)
{
	JSRuntime *ret;

	if(!initialized) {
		initialized=TRUE;
		pthread_mutex_init(&jsrt_mutex, NULL);
		listInit(&rt_list, 0);
		_beginthread(trigger_thread, TRIGGER_THREAD_STACK_SIZE, NULL);
	}
	pthread_mutex_lock(&jsrt_mutex);
	ret=JS_NewRuntime(maxbytes);
	listPushNode(&rt_list, ret);
	pthread_mutex_unlock(&jsrt_mutex);
	return ret;
}

void DLLCALL jsrt_Release(JSRuntime *rt)
{
	list_node_t	*node;

	pthread_mutex_lock(&jsrt_mutex);
	node = listFindNode(&rt_list, rt, 0);
	if(node)
		listRemoveNode(&rt_list, node, FALSE);
	JS_DestroyRuntime(rt);
	pthread_mutex_unlock(&jsrt_mutex);
}
