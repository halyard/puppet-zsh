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

class zsh (
  $package = 'zsh',
  $completion_package = 'zsh-completions',
  $tap = undef,
  $install_completions = true
) {
  homebrew::package { $package:
    tap => $tap
  } ->
  file_line { 'add zsh to /etc/shells':
    path => '/etc/shells',
    line => "${homebrew::rootdir}/bin/zsh",
  } ->
  file { '/etc/zprofile':
    ensure  => present,
    content => ''
  }

  if $install_completions {
    homebrew::package { $completion_package:
      tap => $tap,
    }
  }
}
