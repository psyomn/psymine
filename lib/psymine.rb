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
require 'psymine/version'
require 'psymine/domain/issue_factory'
require 'psymine/domain/project_factory'
require 'psymine/technical/retriever'

# @author  Simon Symeonidis
# @date    Mon Jun 24 21:56:41 EDT 2013
module Psymine
  include Psymine::Domain
  include Psymine::Technical

  # Fetch all the issues
  def self.fetch_issues_by_api_key(uri, api_key)
    json = nil
    ret  = Retriever.new({
      :api_key => api_key, 
      :uri => uri, 
      :get => :issues})

    json = ret.fetch!.body
    IssueFactory.create_all_from_json(json)
  end

  # Fetch all the projects
  def self.fetch_projects_by_api_key(uri, api_key)
    json = nil
    ret  = Retriever.new({
        :api_key => api_key, 
        :uri => uri,
        :get => :projects})
    json = ret.fetch!.body
    ProjectFactory.create_all_from_json(json)
  end
end # module Psymine
