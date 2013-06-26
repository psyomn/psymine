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
    issue.subject      = element["subject"]
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
