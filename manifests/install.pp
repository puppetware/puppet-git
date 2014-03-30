# == Class: git::install
#
# Install Git
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class git::install {
  $version = $git::version

  $source = $::osfamily ? {
    'Darwin' => "http://iweb.dl.sourceforge.net/project/git-osx-installer/git-${version}-intel-universal-snow-leopard.dmg",
  }

  package{"git-${version}":
    ensure => installed,
    source => "${source}",
    provider => pkgdmg,
  }
  ->
  exec {'echo "/usr/local/git/bin\n$(cat /etc/paths)" > /etc/paths':
    onlyif => 'test ! `grep -q "/usr/local/git/bin" /etc/paths`',
    path => ['/usr/bin', '/bin'],
    user => 'root',
  }
}
