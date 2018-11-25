#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

// gcc stack2.c -o stack2 -llua5.3 -I/usr/include/lua5.3/
int main() {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaL_dofile(L, "stack2.lua");

  lua_getglobal(L, "saludar");
  lua_pushstring(L, "TDL");
  lua_call(L, 1, 1);

  size_t l;
  const char *s = lua_tolstring(L, -1, &l);
  lua_pop(L, -1);
  printf("%s Desde C\n", s);

  lua_close(L);
  return 0;
}
