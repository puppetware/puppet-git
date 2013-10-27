# == Class: git
#
# Install Git
#
# === Parameters:
#
# [*version*] Version of Git to be installed
#
# === Examples
#
#  class { git: }
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class git (
  $version = $git::params::version
) inherits git::params {
  anchor {'git::begin': } ->
  class {'git::install': } ->
  anchor {'git::end': }
}