require 'psymine/version'
require 'psymine/domain/issue_factory'
require 'psymine/domain/project_factory'
require 'psymine/technical/retriever'

# @author  Simon Symeonidis
# @license GPL v3.0
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
