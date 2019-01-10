# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles::haproxy
class roles::haproxy {
  include profile::base
  include profile::haproxy
}
