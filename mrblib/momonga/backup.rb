module Momonga
  class << self
    def backup(bnjson, workdir)
      # boostnoteのストレージを読み込む
      note = JSON.parse(File.open(bnjson).read())

      # フォルダ設定は参照しやすいようにキーと名前を対応付ける
      folders = {}
      note["folders"].each {|folder|
        folders[folder["key"]] = folder["name"]

        # フォルダをあらかじめ作る
        return false if !mkdir("#{workdir}")
        return false if !mkdir("#{workdir}/#{folder["name"]}")
      }

      # 巡回してファイルを作る
      note["articles"].each {|article|
        destFullPath = "#{workdir}/#{folders[article["FolderKey"]]}/#{article["title"]}.md"
        File.open(destFullPath,"w+").write(article["content"])
      }
    end
  end
end
