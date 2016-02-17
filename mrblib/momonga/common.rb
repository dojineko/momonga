module Momonga
  class << self
    def mkdir(dir)
      if !File.directory?("#{dir}")
        if !Dir.mkdir("#{dir}")
          echo "#{dir} cannot create"
          return false
        end
      end
      return true
    end
  end
end
