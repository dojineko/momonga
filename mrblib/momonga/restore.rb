module Momonga
  class << self
    def restore(workdir, bnjson)
      result = {}
      folders = []
      articles = []

      Dir.foreach(workdir) {|folderName|
        folderPath = "#{workdir}/#{folderName}"
        next if (folderName.start_with?(".") || !File.directory?(folderPath))

        folderKey = SecureRandom.hex(20)[0,39]
        folders.push({
          "name" => folderName,
          "key" => folderKey,
          })

        Dir.foreach(folderPath) {|fileName|
          filePath = "#{folderPath}/#{fileName}"
          next if fileName.start_with?(".") || !File.file?(filePath)
          nowTime=Time.now().utc()
          nowTimeStr=sprintf("%04d-%02d-%02dT%02d:%02d:%02d.%03dZ", nowTime.year(), nowTime.month(), nowTime.day(), nowTime.hour(), nowTime.min(), nowTime.sec(), nowTime.usec()/1000)
          articles.push({
            "title" => fileName.gsub(File.extname(fileName), ""),
            "content" => File.open("#{filePath}").read(),
            "mode" => "markdown",
            "tags" => [],
            "craetedAt" => nowTimeStr,
            "key" => SecureRandom.hex(20)[0,39],
            "FolderKey" => folderKey,
            "updatedAt" => nowTimeStr,
          })
        }
      }

      result["articles"] = articles
      result["folders"] = folders
      result["version"] = BOOSTNOTE_VERSION

      File.open(bnjson, "w+").write(JSON.generate(result, {:pretty_print => true, :indent_with => 2}) + "\n")
    end
  end
end
