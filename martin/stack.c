#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

// gcc stack.c -o stack -llua5.3 -I/usr/include/lua5.3/
int main() {
  //Inicializa el interprete de Lua
  lua_State *L = luaL_newstate();
  //Cargamos las librerias base de Lua (math, i/o, etc)
  luaL_openlibs(L);

  // Ya podemos usar Lua! accediendo a la variable L
  luaL_dofile(L, "stack.lua");

  lua_close(L);
  return 0;
}
