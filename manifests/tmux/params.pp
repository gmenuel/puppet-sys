# == Class: sys::tmux::params
#
# Platform-dependent parameters for installing tmux.
#
class sys::tmux::params {
  case $facts['os']['family'] {
    openbsd: {
      # tmux included by default
      $package = false
    }
    debian: {
      $package = 'tmux'
    }
    redhat: {
      $package = 'tmux'
    }
    default: {
      fail("Do not know how to install tmux on ${facts['os']['family']}.")
    }
  }
}
