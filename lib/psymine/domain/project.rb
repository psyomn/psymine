module Psymine::Domain
# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Sat Jun 22 23:29:09 EDT 2013
# Project class representing its domain object.
class Project
  def initialize
  end

  # NOTE it looks like redmine probably stores the name in string format for
  # the ids of projects (usually everything is lowercase)
  attr_accessor :id
  attr_accessor :description
  attr_accessor :name
end
end # Psymine::Domain
