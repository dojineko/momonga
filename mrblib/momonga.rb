def __main__(argv)
  opts = Getopts.getopts('vh', 'version', 'help')

  if opts['v'] || opts['version']
    Momonga::version
    return
  end

  if opts['h'] || opts['help']
    Momonga::usage
    return
  end
end
