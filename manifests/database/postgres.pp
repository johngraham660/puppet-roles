# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include roles::database::postgres
class roles::database::postgres {
  include profiles::base
  include profiles::postgres
}
