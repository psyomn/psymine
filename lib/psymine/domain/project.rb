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
# Project class representing its domain object.
class Project
  # No init here. We leave this task to the IssueFactory for creation of these
  # domain objects.
  def initialize
  end

  # For cute console output. Subclass and overload if you want your own output.
  # @return String representation of the Project domain object
  def to_s
    "[#{@id}] #{@name}\n"\
    "#{@description}\n"
  end

  # For debugging that is easy on the eyes.
  # @return String concise description of the object
  def inspect
    "<#{self.class.name.split('::').last} "\
      "@id=#{@id} "\
      "@name=\"#{@name}\">"
  end

  # NOTE it looks like redmine probably stores the name in string format for
  # the ids of projects (usually everything is lowercase)
  attr_accessor :id
  attr_accessor :description
  attr_accessor :name
end
end # Psymine::Domain
