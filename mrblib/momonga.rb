def __main__(argv)
  opts = Getopts.getopts('vh', 'version', 'help', 'mode:', 'workdir:', 'bnjson:')

  if opts['v'] || opts['version']
    Momonga.version
    return
  end

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

  case opts['mode']
  when 'backup'
    Momonga.backup(bnjson, workdir)
  when 'restore'
    Momonga.restore(workdir, bnjson)
  else
    print("--mode is required.\n")
    Momonga.usage
  end
end
