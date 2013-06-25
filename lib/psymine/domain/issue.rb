module Psymine::Domain
# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Sat Jun 22 23:29:09 EDT 2013
# Issue class representing its domain object.
class Issue
  def initialize
  end

  attr_accessor :id
  attr_accessor :status
  attr_accessor :project
  attr_accessor :description
  attr_accessor :author
  attr_accessor :done_ratio
end # class Issue
end # Psymine::Domain
