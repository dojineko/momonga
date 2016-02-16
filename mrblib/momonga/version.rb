module Momonga
  VERSION = "0.0.1"
  BOOSTNOTE_VERSION = "0.4"

  class << self
    def version
     msg =<<EOS
momonga #{VERSION}
EOS
    print msg
    end
  end
end
