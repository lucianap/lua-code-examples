#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

// gcc stack3.c -o mylib.so -llua5.3 -I/usr/include/lua5.3/ -shared -fPIC
static int c_saludar(lua_State *L) {
  size_t l;
  const char *nombre = lua_tolstring(L, 1, &l); /* get argument */
  printf("Hola %s! Desde C\n", nombre);

  lua_pushstring(L, nombre); /* push result */
  return 1; /* number of results */
}

static const struct luaL_Reg mylib [] = {
  {"c_saludar", c_saludar},
  {NULL,NULL}
};

// Esta función debe llamarse como el ejecutable
int luaopen_mylib(lua_State *L) {
  luaL_newlib(L, mylib);   /* Registramos la funcion en Lua */
  return 1;
}
