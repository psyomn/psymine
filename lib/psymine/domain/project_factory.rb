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
