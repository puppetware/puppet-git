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
  
  package{"git-${version}":
    ensure => installed,
    source => "https://git-osx-installer.googlecode.com/files/git-${version}-intel-universal-snow-leopard.dmg",
    provider => pkgdmg,
  }
}