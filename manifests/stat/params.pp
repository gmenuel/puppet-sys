# == Class: sys::stat::params
#
# Platform-dependent parameters for sysstat.
#
class sys::stat::params {
  case $facts['os']['family'] {
    darwin, openbsd, solaris: {
      # Unix-derived systems have iostat built in.
      $package = false
    }
    debian, redhat: {
      $package = 'sysstat'
    }
    default: {
      fail("Don't know how to install sysstat on ${facts['os']['family']}.\n")
    }
  }
}
