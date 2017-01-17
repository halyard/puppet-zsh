Puppet::Type.type(:osx_shell).provide(:dscl) do
  desc "dscl support for setting shell on OSX"

  commands :dscl => '/usr/bin/dscl'

  def shell
    @shell ||= run_dscl(:read).split.last
  end

  def shell=(value)
    run_dscl :change, shell, value
  end

  def run_dscl(action, *args)
    dscl '.', "-#{action}", "/Users/#{resource[:name]}", 'UserShell', *args
  end
end
