#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

// gcc main.c -o main -llua5.3 -I/usr/include/lua5.3/
int main() {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaL_dofile(L, "hola.lua");

  return 0;
}
