-- This file was automatically generated for the LuaDist project.

package = "lzt"
version = "0.1.0-0"

description = {
   summary = "command-line tool to work with a luazdf repository",
   license = "MIT",
   homepage = "https://github.com/aiq/lzt"
}

-- LuaDist source
source = {
  tag = "0.1.0-0",
  url = "git://github.com/LuaDist-testing/lzt.git"
}
-- Original source
-- source = {
--    url = "https://github.com/aiq/lzt/archive/v0.1.0.tar.gz",
--    md5 = "05e73dab47d7b3a6e871b0b658293a28",
--    dir = "lzt-0.1.0"
-- }

dependencies = {
   "lua >= 5.1",
   "luafilesystem",
   "lustache"
}

build = {
   type = "builtin",
   modules = {},
   install = {
      bin = {
         [ "lzt" ] = "bin/lzt"
      }
   }
}