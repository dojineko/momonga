module Momonga
  class << self
    def backup(bnjson, workdir)
      # boostnoteのストレージを読み込む
      note = JSON.parse(File.open(bnjson).read())

      # フォルダ設定は参照しやすいようにキーと名前を対応付ける
      folders = {}
      note["folders"].each {|folder|
        folders[folder["key"]] = folder["name"]
      }

      # 巡回してファイルを作る
      note["articles"].each {|article|
        if !File.directory?("#{workdir}")
          if !Dir.mkdir("#{workdir}")
            echo "#{workdir} cannot create"
            return
          end
        end

        destDir = "#{workdir}/#{folders[article["FolderKey"]]}"
        if !File.directory?("#{destDir}")
          if !Dir.mkdir("#{destDir}")
            echo "#{destDir} cannot create"
            return
          end
        end

        destFullPath = "#{destDir}/#{article["title"]}.md"
        File.open(destFullPath,"w+").write(article["content"])
      }
    end
  end
end
