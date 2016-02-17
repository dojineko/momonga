def __main__(argv)
  opts = Getopts.getopts('vh', 'version', 'help', 'mode:', 'workdir:', 'bnjson:')

  # バージョンを表示
  if opts['v'] || opts['version']
    Momonga.version
    return
  end

  # 使い方を表示
  if opts['h'] || opts['help']
    Momonga.usage
    return
  end

  # 引数を処理
  if opts['workdir'].empty?
    print("--workdir is required.\n")
    return 1
  else
    workdir = opts['workdir']
  end
  if opts['bnjson'].empty?
    print("--bnjson is required.\n")
    return 1
  else
    bnjson = opts['bnjson']
  end

  # モード切替
  case opts['mode']
  when 'backup'
    Momonga.backup(bnjson, workdir)
  when 'restore'
    Momonga.restore(workdir, bnjson)
  else
    # 想定外の場合は警告して使い方を表示
    print("--mode is required.\n")
    Momonga.usage
    return 1
  end
end
