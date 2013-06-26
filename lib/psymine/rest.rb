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
