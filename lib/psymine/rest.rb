require 'psymine'
# @author Simon Symeonidis
# @date   Mon Jun 24 19:59:50 EDT 2013
# Contains the REST api static strings for redmine.
module Psymine::Rest
  # The field name of the http header field as required by redmine >= 1.1.0
  HttpHeader  = "X-Redmine-API-Key"

  # The issues constant string to the REST API of Redmine
  Issues      = "issues/"

  # The projects constant string to the REST API of Redmine
  Projects    = "projects/"
  
  # The users constant string to the REST API of Redmine
  Users       = "users/"
  
  # The time entry constant string to the REST API of Redmine
  TimeEntries = "time_entries/"
end
