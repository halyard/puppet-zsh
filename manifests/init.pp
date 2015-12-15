# == Class: zsh
#
# Set the shell to zsh
#
# === Parameters
#
# === Example
#
#   include zsh
#

class zsh {
  package { [
    'zsh',
    'zsh-completions'
  ]: }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${homebrew::config::homebrew_root}/bin/zsh",
    require => Package['zsh'],
  } ->
  file { '/etc/zprofile':
    ensure  => present,
    content => ''
  } ->
  osx_chsh { $::user:
    shell   => "${homebrew::config::homebrew_root}/bin/zsh",
  }
}
