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

module Psymine::Domain
# @author  Simon Symeonidis
# @date    Mon Jun 24 23:29:09 EDT 2013
# Redmine repository manager that handles lookup of different repositories etc.
class RedmineRepository
  def initialize(hparams)
    check_all_params_available(hparams)
  end

private

  def check_all_params_available(hparams)
    var_array = [:uri,:label,:api_key] 
    res = hparams.keys.inject(true){|sum,el| sum and var_array.member? el}
    if res then
      raise
    end 
  end

  attr_reader :uri

  attr_reader :label

  attr_reader :api_key
end # class RedmineRepository
end # Psymine::Domain
