# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles::loadbalancer
class roles::loadbalancer {
  include profiles::base
  include profiles::haproxy
}
