module Momonga
  class << self
    def usage
      msg =<<EOS
Usage: momonga

-v | --version  Show version.
-h | --help     Show usage.

--mode          Set execute mode, "backup" or "restore".

--workdir       Select working directory.
                when mode is "backup", will be destinate directory.
                when mode is "restore", will be source directory.

--bnjson        Set Boostnote's local.json path.
                ex: ~/Library/Application Support/boost/local.json

Require exit boostnote completely, before ur MOMONGING :p
EOS
      print msg
    end
  end
end
