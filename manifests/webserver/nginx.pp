# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles::webserver::nginx
class roles::webserver::nginx {
  include profile::base
  include profile::nginx
}
