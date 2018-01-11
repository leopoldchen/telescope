.PHONY:	test spec
LUA_DIR = /usr/local
LUA_VERSION = `lua -e 'print(_VERSION:sub(5,7))'`
LUA_SHARE = $(LUA_DIR)/share/lua/$(LUA_VERSION)

.PHONY : test clean docs install uninstall

spec:
	tsc -f spec/*.lua

test:
	tsc spec/*.lua

docs: clean
	ldoc -t "Telescope API Docs" telescope.lua

clean:
	rm -rf docs

install:
	ln -s tsc.lua $(LUA_DIR)/bin/tsc

uninstall:
	-rm $(LUA_DIR)/bin/tsc
