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
require 'psymine/domain/issue_factory'
require 'psymine/domain/project_factory'
require 'psymine/technical/retriever'

module Psymine::Domain
# @author  Simon Symeonidis
# @date    Mon Jun 24 23:29:09 EDT 2013
# Redmine repository manager that handles lookup of different repositories etc.
# NOTE: Currently not suporting username and password authentication. Maybe
# this will happen in the future.
class RedmineRepository
  include Psymine::Technical
  # Initialize the RedmineRepository object with given parameters.
  # @params hparams [Hash] that accepts strings to symbols of :uri, :label,
  #   :api_key. 
  # 
  # @example Simple initializement
  # repo = RedmineRepository.new(
  #   {:uri => "location.com", 
  #    :label => "optional",
  #    :api_key => "your redmine API key"})
  def initialize(hparams)
    @uri      = hparams[:uri]
    @label    = hparams[:label]
    @api_key  = hparams[:api_key]
    @issues   = nil
    @projects = nil
  end

  # Lazy method to get the issues from the Redmine repo. If issues are not
  # initialized, then get_issues! is called to actually retrieve them. Else
  # the @issues instance variable is returned
  #
  # @return Array<Issue>
  def get_issues
    @issues == nil ? 
      @issues = get_issues! :
      @issues
  end

  # Lazy method to get the projects from the Redmine repo. If projects are not
  # initialized, then get_projects! is called to actually retrieve them. Else
  # the @projects instance variable is returned
  #
  # @return Array<Project>
  def get_projects
    @projects == nil ?
      @projects = get_projects! :
      @projects
  end

  # Return the Issues from the actual API
  # @return Array<Issue>
  def get_issues!
    json = nil
    ret  = Retriever.new({
      :api_key => @api_key, 
      :uri => @uri, 
      :get => :issues})
    json = ret.fetch!
    IssueFactory.create_all_from_json(json)
  end

  # Return the Projects from the actual API
  # @return Array<Project>
  def get_projects!
    json = nil
    ret  = Retriever.new({
        :api_key => @api_key, 
        :uri => @uri,
        :get => :projects})
    json = ret.fetch!
    ProjectFactory.create_all_from_json(json)
  end

  attr_accessor :issues
  attr_accessor :projects

  attr_reader :uri
  attr_reader :label
  attr_reader :api_key
  attr_reader :user
  attr_reader :password
end # class RedmineRepository
end # Psymine::Domain
