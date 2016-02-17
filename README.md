Momonga
=======

> :hamster: Momonga is a Simple memo convert & backup/restore tool.

Momonga はメモの移行やバックアップ・リストアのための簡易的なツールです。  
現時点ではBoostnoteへの移行や、あるいはその逆に使うことのみを想定し、下記の形式に対応しています。

- Markdown
- Boostnote

----

## Usage

### Backup
Boostnoteに格納されているデータをMarkdownで単一ファイルに出力します。

```sh
$ momonga --mode backup --workdir ~/Desktop/notes --bnjson ~/Library/Application\ Support/boost/local.json
```

フォルダ階層を保持して、下記のように保存されます。  
ファイル名は `タイトル.md` となります。

```
- ~/Desktop/notes
    - default
        - noteA.md
        - noteB.md
        - noteC.md
    - draft
        - draftA.md
        - draftB.md
```

### Restore
バックアップで出力されたデータを元に、Boostnoteにデータを復帰します。  
`local.json` 中の既存データは上書きされるので注意してください。

```sh
$ momonga --mode restore --workdir ~/Desktop/notes --bnjson ~/Library/Application\ Support/boost/local.json
```

### Memo
- 作業前に関連するアプリケーションは終了することをおすすめします。
- バックアップ、リストア共に下記の情報は保持されません。
    - タイムスタンプ
    - フォルダカラー
    - シンタックス
    - タグ

## License
MIT
