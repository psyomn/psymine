module Psymine::Domain
# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Sat Jun 22 23:29:09 EDT 2013
# Issue class representing its domain object.
class Issue
  # No init here. We leave this task to the IssueFactory for creation of these
  # domain objects.
  def initialize
  end

  # For cute console output. Subclass and overload if you want your own output.
  # @return String representation of the Issue domain object
  def to_s
  end

  # For debugging that is easy on the eyes.
  # @return String concise description of the object
  def inspect
    "<#{self.class.name.split('::').last} "\
      "@id=#{@id} "\
      "@status_name=\"#{@status_name}\"' "\
      "@status_id=#{@status_id} "\
      "@author_name=\"#{@author_name}\" "\
      "@author_id=#{@author_id} "\
      "@project_id=#{@project_id} "\
      "@project_name=\"#{@project_name}\" "\
      "@done_ratio=#{@done_ratio}>"
  end

  attr_accessor :id
  attr_accessor :status_id
  attr_accessor :status_name
  attr_accessor :project_id
  attr_accessor :project_name
  attr_accessor :description
  attr_accessor :author_id
  attr_accessor :author_name
  attr_accessor :done_ratio
end # class Issue
end # Psymine::Domain
