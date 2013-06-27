# This file is part of Psymine.
# 
# Psymine is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Psymine is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Psymine.  If not, see <http://www.gnu.org/licenses/>.

module Psymine::Domain
# @author  Simon Symeonidis
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
    "[#{@id}] #{@subject} (#{@project_name})\n"\
    "#{@description}\n"
  end

  # For debugging that is easy on the eyes.
  # @return String concise description of the object
  def inspect
    "<#{self.class.name.split('::').last} "\
      "@id=#{@id} "\
      "@subject=\"#{@subject}\" "\
      "@status_id=#{@status_id} "\
      "@status_name=\"#{@status_name}\"' "\
      "@author_id=#{@author_id} "\
      "@author_name=\"#{@author_name}\" "\
      "@project_id=#{@project_id} "\
      "@project_name=\"#{@project_name}\" "\
      "@done_ratio=#{@done_ratio}>"
  end

  attr_accessor :id
  attr_accessor :subject
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

