require 'psymine'
require 'psymine/technical/retriever'
module Psymine::Presentation
# @author  Simon Symeonidis
# @license GPL v3.0
# @date Mon Jun 24 19:31:18 EDT 2013
# Facade controller for other applications to (easy) interface with this gem 
# library.
class Facade

  def self.fetch_issues_by_api_key(redmine_uri,api_key)
    include Psymine::Technical
    ret = Retriever.new({:api_key => api_key, 
                         :uri => redmine_uri, :get => :issues})
    ret.fetch!
  end

private

end # class TimeEntry
end # module Psymine
