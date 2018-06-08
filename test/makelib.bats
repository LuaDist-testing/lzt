#!/usr/bin/env bats

@test "makelib" {
   run ../bin/lzt --dir data/zdf makelib
   [ "$status" -eq 0 ]
   [ "${lines[ 0]}" = '-------------------------------------------------------------------------require' ]
   [ "${lines[ 1]}" = 'local ccc = require( "ccc" ) --ZREQ-ccc' ]
   [ "${lines[ 2]}" = 'local liby = require( "liby" ) --ZREQ-liby' ]
   [ "${lines[ 3]}" = '-----------------------------------------------------------------------functions' ]
   [ "${lines[ 4]}" = '--ZFUNC-func1a-v1' ]
   [ "${lines[ 5]}" = 'local function func1a()' ]
   [ "${lines[ 6]}" = '   return "a"' ]
   [ "${lines[ 7]}" = 'end' ]
   [ "${lines[ 8]}" = '--ZFUNC-func1b-v1' ]
   [ "${lines[ 9]}" = 'local function func1b()' ]
   [ "${lines[10]}" = '   return "b"' ]
   [ "${lines[11]}" = 'end' ]
   [ "${lines[12]}" = '--ZFUNC-func2ax-v1' ]
   [ "${lines[13]}" = 'local function func2ax()' ]
   [ "${lines[14]}" = '   return func1a().."x"' ]
   [ "${lines[15]}" = 'end' ]
   [ "${lines[16]}" = '--ZFUNC-func1c-v1' ]
   [ "${lines[17]}" = 'local function func1c( ... )' ]
   [ "${lines[18]}" = '   --TODO' ]
   [ "${lines[19]}" = 'end' ]
   [ "${lines[20]}" = '--ZFUNC-func1dax-v1' ]
   [ "${lines[21]}" = 'local function func1dax()' ]
   [ "${lines[22]}" = '   return "d"..func2ax()' ]
   [ "${lines[23]}" = 'end' ]
   [ "${lines[24]}" = '--ZFUNC-func2baxz-v1' ]
   [ "${lines[25]}" = 'local function func2baxz()' ]
   [ "${lines[26]}" = '   return func1b()..func2ax().."z"' ]
   [ "${lines[27]}" = 'end' ]
   [ "${lines[28]}" = '--ZFUNC-func2y-v2' ]
   [ "${lines[29]}" = 'local function func2y( ... )' ]
   [ "${lines[30]}" = '   --TODO' ]
   [ "${lines[31]}" = 'end' ]
   [ "${lines[32]}" = '--------------------------------------------------------------------------module' ]
   [ "${lines[33]}" = 'local Z = {}' ]
   [ "${lines[34]}" = 'Z.func1a = func1a' ]
   [ "${lines[35]}" = 'Z.func1b = func1b' ]
   [ "${lines[36]}" = 'Z.func1c = func1c' ]
   [ "${lines[37]}" = 'Z.func1dax = func1dax' ]
   [ "${lines[38]}" = 'Z.func2ax = func2ax' ]
   [ "${lines[39]}" = 'Z.func2baxz = func2baxz' ]
   [ "${lines[40]}" = 'Z.func2y = func2y' ]
   [ "${lines[41]}" = 'return Z' ]
}

@test "makelibe --with" {
   run ../bin/lzt --dir data/zdf makelib --with func2baxz
   [ "$status" -eq 0 ]
   [ "${lines[ 0]}" = '-----------------------------------------------------------------------functions' ]
   [ "${lines[ 1]}" = '--ZFUNC-func2baxz-v1' ]
   [ "${lines[ 2]}" = 'local function func2baxz()' ]
   [ "${lines[ 3]}" = '   --ZFUNC-func1b-v1' ]
   [ "${lines[ 4]}" = '   local function func1b()' ]
   [ "${lines[ 5]}" = '      return "b"' ]
   [ "${lines[ 6]}" = '   end' ]
   [ "${lines[ 7]}" = '   --ZFUNC-func2ax-v1' ]
   [ "${lines[ 8]}" = '   local function func2ax()' ]
   [ "${lines[ 9]}" = '      --ZFUNC-func1a-v1' ]
   [ "${lines[10]}" = '      local function func1a()' ]
   [ "${lines[11]}" = '         return "a"' ]
   [ "${lines[12]}" = '      end' ]
   [ "${lines[13]}" = '      return func1a().."x"' ]
   [ "${lines[14]}" = '   end' ]
   [ "${lines[15]}" = '   return func1b()..func2ax().."z"' ]
   [ "${lines[16]}" = 'end' ]
   [ "${lines[17]}" = '--------------------------------------------------------------------------module' ]
   [ "${lines[18]}" = 'local Z = {}' ]
   [ "${lines[19]}" = 'Z.func2baxz = func2baxz' ]
   [ "${lines[20]}" = 'return Z' ]
}
