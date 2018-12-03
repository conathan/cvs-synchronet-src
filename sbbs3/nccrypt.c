#include <crypt.h>
#include <sys/random.h>
#include <stdio.h>
#include <string.h>

const char* str2pwd(const char *rawpasswd) {
  const char *seedchars = 
    "./0123456789ABCDEFGHIJKLMNOPQRST"
    "UVWXYZabcdefghijklmnopqrstuvwxyz";
  unsigned char salt[20];
  char *ret;
  int i;
  
  //use SHA256 w/ Salt
  strcpy(salt, "$6$");
  i=0;
  while(i<16) {
    i+=getrandom(salt+3+i, 16-i, GRND_RANDOM);
  }

  for(i=0; i<16; i++) {
    salt[i+3]=seedchars[salt[i+3]%64];
  }

  salt[16+3+1]=0;
  printf("Salt: %s\n", salt);
  ret=crypt(rawpasswd, salt);

  printf("%d\n",ret);
  return ret;
}

int pwdcmp(const char *rawpasswd, const char *hashpasswd) {
  unsigned char salt[20];
  unsigned char *pwd;

  pwd=crypt(rawpasswd,hashpasswd);
  printf("%s\n", pwd);
  return strncmp(pwd, hashpasswd,128)==0;
}
