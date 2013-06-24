module Psymine::Domain
# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Mon Jun 24 23:29:09 EDT 2013
# Redmine repository manager that handles lookup of different repositories etc.
# TODO: I think I'm going to remove this
class RedmineRepositoryManager
  def initialize
  end

  # [Array<RedmineRepository>]
  attr_accessor :redmines
end
end # Psymine::Domain
