macro(double_require_lib_dir TARGET LIB LIBDIR)
	if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_LIST_DIR}")
		if(NOT DEFINED ${LIBDIR}_DONE)
			add_subdirectory(../../${LIBDIR} ${LIB})
			set(${LIBDIR}_DONE TRUE)
		endif()
	endif()
	add_dependencies(${TARGET} ${LIB})
	target_include_directories(${TARGET} PRIVATE ../../${LIBDIR})
	target_compile_definitions(${TARGET} PRIVATE $<TARGET_PROPERTY:${LIB},INTERFACE_COMPILE_DEFINITIONS>)
	target_link_libraries(${TARGET} ${LIB})
endmacro()

macro(double_require_lib TARGET LIB)
	double_require_lib_dir(${TARGET} ${LIB} ${LIB})
endmacro()

macro(require_lib_dir TARGET LIB LIBDIR)
	if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_LIST_DIR}")
		if(NOT DEFINED ${LIBDIR}_DONE)
			add_subdirectory(../${LIBDIR} ${LIB})
			set(${LIBDIR}_DONE TRUE)
		endif()
	endif()
	add_dependencies(${TARGET} ${LIB})
	target_include_directories(${TARGET} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../${LIBDIR})
	target_compile_definitions(${TARGET} PRIVATE $<TARGET_PROPERTY:${LIB},INTERFACE_COMPILE_DEFINITIONS>)
	target_link_libraries(${TARGET} ${LIB})
endmacro()

macro(require_lib TARGET LIB)
	require_lib_dir(${TARGET} ${LIB} ${LIB})
endmacro()
