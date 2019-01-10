# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles::webserver::apache
class roles::webserver::apache {
  include profiles::base
  include profiles::apache
}
