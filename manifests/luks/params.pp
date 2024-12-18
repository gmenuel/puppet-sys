# == Class: sys::luks::params
#
# Platform-dependent parameters for LUKS.
#
class sys::luks::params {
  case $facts['os']['family'] {
    debian: {
      $package = 'cryptsetup'
    }
    redhat: {
      case $facts['os']['release']['major'] {
        7: {
          $package = 'cryptsetup'
        }
        default: {
          $package = 'cryptsetup-luks'
        }
      }
    }
    'Suse': {
      $package = 'cryptsetup'
    }
    default: {
      fail("Do not know how to install LUKS on ${facts['os']['family']}.\n")
    }
  }
}
