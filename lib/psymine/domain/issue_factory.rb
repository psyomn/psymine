require 'json'

require 'psymine/domain/issue'

module Psymine::Domain
# @author Simon Symeonidis
# Issue domain object factory (As in architecture style)
class IssueFactory 

  # Create an array of issue domain objects that are parsed out from the json
  # @param json_array is the json arry of items, each being one issue
  # @return Array<Issue>
  def self.create_all_from_json(json_array)
    elements = JSON.parse(json_array)
    issues = Array.new
    
    elements["issues"].each do |issue|
      issues.push create_from_data(issue)
    end

    issues
  end

private
  # Create a single Issue domain object from a single json element that 
  # represents it.
  # @param json is the single json element that represents one issue
  # @return Issue
  def self.create_from_data(element)
    issue              = Issue.new

    issue.id           = element["id"]
    issue.description  = element["description"]
    issue.project_name = element["project"]["name"]
    issue.project_id   = element["project"]["id"]
    issue.status_name  = element["status"]["name"]
    issue.status_id    = element["status"]["id"]
    issue.author_name  = element["author"]["name"]
    issue.author_id    = element["author"]["id"]
    issue.done_ratio   = element["done_ratio"]
    issue
  end


end # class IssueFactory
end # module Psymine::Domain
