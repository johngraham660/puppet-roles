# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles
class roles {
  include roles::base
  include roles::puppetserver
  include roles::database::mysql
  include roles::database::postgress
  include roles::webserver::apache
  include roles::webserver::nginx
  include roles::ciserver
  include roles::haproxy
}
