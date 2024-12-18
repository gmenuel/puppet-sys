# == Class: sys::wget::params
#
# Platform-dependent parameters for wget.
#
class sys::wget::params {
  case $facts['os']['family'] {
    openbsd: {
      include sys::openbsd::pkg
      $package = 'wget'
      $path = '/usr/local/bin/wget'
      $provider = undef
      $source = $sys::openbsd::pkg::source
    }
    solaris: {
      include sys::solaris
      $package = 'web/wget'
      $path = '/usr/bin/wget'
      $provider = 'pkg'
      $source = undef
    }
    default: {
      $package = 'wget'
      $path = '/usr/bin/wget'
      $provider = undef
      $source = undef
    }
  }
}
