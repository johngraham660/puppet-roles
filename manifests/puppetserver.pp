# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles::puppetserver
class roles::puppetserver {
  include profile::base
  include profile::puppetserver
}