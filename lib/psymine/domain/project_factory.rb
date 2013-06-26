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

require 'json'

require 'psymine/domain/project'
require 'psymine/domain/domain_exception'

module Psymine::Domain
# @author Simon Symeonidis
# Project domain object factory (As in architecture style)
class ProjectFactory
  # Create an array of project domain objects that are parsed out from the json
  # @param json_array is the json arry of items, each being one project
  # @return Array<Project>
  def self.create_all_from_json(json_array)
    elements = JSON.parse(json_array)
    projects = Array.new
    
    elements["projects"].each do |project|
      projects.push create_from_data(project)
    end

    projects
  end

private

  # Create a single Project domain object from a single json element that 
  # represents it.
  # @param json is the single json element that represents one project
  # @return Project
  def self.create_from_data(element)
    project             = Project.new

    project.id          = element["identifier"]
    project.description = element["description"]
    project.name        = element["name"]
    project
  end

end # class ProjectFactory
end # module Psymine::Domain
