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
  String[1] $package = 'zsh',
  String[1] $completion_package = 'zsh-completions',
  Boolean $install_completions = true
) {
  package { $package:
    provider => brew
  }
  -> file_line { 'add zsh to /etc/shells':
    path => '/etc/shells',
    line => "${homebrew::path}/bin/zsh",
  }
  -> file { '/etc/zprofile':
    ensure  => present,
    content => ''
  }
  -> osx_shell { $::id:
    shell => "${homebrew::path}/bin/zsh"
  }

  if $install_completions {
    package { $completion_package:
      provider => brew
    }
  }
}
