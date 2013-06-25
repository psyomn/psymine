module Psymine::Domain
# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Sat Jun 22 23:29:09 EDT 2013
# Project class representing its domain object.
class Project
  # No init here. We leave this task to the IssueFactory for creation of these
  # domain objects.
  def initialize
  end

  # For cute console output. Subclass and overload if you want your own output.
  # @return String representation of the Project domain object
  def to_s
  end

  # For debugging that is easy on the eyes.
  # @return String concise description of the object
  def inspect
    "<#{self.name} @id=#{@id} @name=#{@name}>"
  end

  # NOTE it looks like redmine probably stores the name in string format for
  # the ids of projects (usually everything is lowercase)
  attr_accessor :id
  attr_accessor :description
  attr_accessor :name
end
end # Psymine::Domain
