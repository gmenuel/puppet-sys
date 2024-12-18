# == Class: sys::apt::mirror
#
# Create `/etc/apt/sources.list` like Ubuntu configures it by default,
# but with the URI replaced with the mirror of your choosing.
#
# === Parameters
#
# [*uri*]
#  The URI to use for the mirror.  Defaults to:
#  'http://us.archive.ubuntu.com/ubuntu/'.
#
# [*source*]
#  Whether or not to include the debian source package repositories.
#  Defaults to true.
#
class sys::apt::mirror(
  $uri    = 'http://us.archive.ubuntu.com/ubuntu/',
  $source = true,
){
  include sys::apt::update
  $repositories = [
    {
      'uri'          => $uri,
      'distribution' => $facts['os']['distro']['codename'],
      'components'   => ['main', 'restricted'],
    },
    {
      'uri'          => $uri,
      'distribution' => "${facts['os']['distro']['codename']}-updates",
      'components'   => ['main', 'restricted'],
    },
    {
      'uri'          => $uri,
      'distribution' => $facts['os']['distro']['codename'],
      'components'   => 'universe',
    },
    {
      'uri'          => $uri,
      'distribution' => "${facts['os']['distro']['codename']}-updates",
      'components'   => 'universe',
    },
    {
      'uri'          => $uri,
      'distribution' => $facts['os']['distro']['codename'],
      'components'   => 'multiverse',
    },
    {
      'uri'          => $uri,
      'distribution' => "${facts['os']['distro']['codename']}-updates",
      'components'   => 'multiverse',
    },
    {
      'uri'          => $uri,
      'distribution' => "${facts['os']['distro']['codename']}-security",
      'components'   => ['main', 'restricted'],
    },
    {
      'uri'          => $uri,
      'distribution' => "${facts['os']['distro']['codename']}-security",
      'components'   => 'universe',
    },
    {
      'uri'          => $uri,
      'distribution' => "${facts['os']['distro']['codename']}-security",
      'components'   => 'multiverse',
    },
  ]

  sys::apt::sources { "${sys::apt::root}/sources.list":
    repositories => $repositories,
    source       => $source,
    notify       => Exec['apt-update'],
  }
}
