PROJECT(rolang)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)


SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/CMakeModules")

SET(CXX11_FLAGS "-std=c++11")
SET(CDEBUG_FLAGS -g)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX11_FLAGS} ${CDEBUG_FLAGS}")

IF(UNIX)
  ADD_DEFINITIONS(-DUNIX)
ENDIF(UNIX)

# Set Includes
INCLUDE_DIRECTORIES(
  "${PROJECT_SOURCE_DIR}/include"
)

FIND_PACKAGE(BISON REQUIRED)
SET(BISON_OUTPUT ${CMAKE_SOURCE_DIR}/src/parser.cpp)
IF(BISON_FOUND)
    ADD_CUSTOM_COMMAND(
      OUTPUT ${BISON_OUTPUT}
      PRE_BUILD
      COMMAND ${BISON_EXECUTABLE}
              --defines=${CMAKE_SOURCE_DIR}/include/tokens.h
              --output=${BISON_OUTPUT}
              ${CMAKE_SOURCE_DIR}/parsing/parser.y
      DEPENDS ${CMAKE_SOURCE_DIR}/parsing/parser.y
      COMMENT "Generating parser.cpp"
    )
ENDIF()

FIND_PACKAGE(FLEX REQUIRED)
SET(FLEX_OUTPUT ${CMAKE_SOURCE_DIR}/src/scanner.cpp)
IF(FLEX_FOUND)
    ADD_CUSTOM_COMMAND(
      OUTPUT ${FLEX_OUTPUT}
      PRE_BUILD
      COMMAND ${FLEX_EXECUTABLE}
              --outfile=${FLEX_OUTPUT}
              ${CMAKE_SOURCE_DIR}/parsing/scanner.l
      DEPENDS ${CMAKE_SOURCE_DIR}/parsing/scanner.l
      COMMENT "Generating scanner.cpp"
    )
ENDIF()

# Set sources
FILE(GLOB_RECURSE SOURCES "src/*.cpp")
ADD_EXECUTABLE(${PROJECT_NAME} ${SOURCES})

ADD_LIBRARY(MyLib ${BISON_OUTPUT} ${FLEX_OUTPUT})

ADD_CUSTOM_TARGET("${PROJECT_NAME}_SUCCESSFUL" ALL
                  DEPENDS ${PROJECT_NAME}
                  COMMAND ${CMAKE_COMMAND} -E echo ""
                  COMMAND ${CMAKE_COMMAND} -E echo "====================="
                  COMMAND ${CMAKE_COMMAND} -E echo "  Compile complete!"
                  COMMAND ${CMAKE_COMMAND} -E echo "====================="
                  COMMAND ${CMAKE_COMMAND} -E echo "${CMAKE_CURRENT_BINARY_DIR}"
                 )

TARGET_LINK_LIBRARIES(${PROJECT_NAME})
