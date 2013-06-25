require 'psymine/version'
require 'psymine/technical/retriever'

# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Mon Jun 24 21:56:41 EDT 2013
module Psymine
  include Psymine::Technical

  # Fetch all the issues
  def self.fetch_issues_by_api_key(uri, api_key)
    ret = Retriever.new({
      :api_key => api_key, 
      :uri => uri, 
      :get => :issues})
    ret.fetch!
  end

  # Fetch all the projects
  def self.fetch_projects_by_api_key(uri, api_key)
    ret = Retriever.new({
        :api_key => api_key, 
        :uri => uri,
        :get => :projects})
    ret.fetch!
  end
end # module Psymine
