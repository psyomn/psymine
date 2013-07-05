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
require 'open-uri'
require 'net/http'

# lib
require 'psymine/rest'
require 'psymine/technical/technical_exception'

module Psymine::Technical
# @author  Simon Symeonidis
# @date    Sun Jun 23 13:39:41 EDT 2013
# This is a helper class that will build the request with appropriate headers
# and send it to the foreign redmine repo. It is also responsible returning the
# appropriate JSON.
class Retriever

  # @example Connecting with Username and Password and fetching Issues
  #   ret = Retriever.new({:user => '...', :password => '...', :get => :issues})
  #   ret.fetch!
  #
  # @example Connecting with API generated Key and fetching Projects
  #   ret = Retriever.new({:api => '...', :get => :projects}) 
  #   ret.fetch!
  # 
  # @params hparams are the hash values passed that are used accordingly in
  #   order to initialize the retriever (and make it understand how to 
  #   interface with redmine).
  def initialize(hparams)
    # Make sure that the uri ends with a '/'
    # cases : uri.com vs uri.com/
    tmp_uri      = hparams[:uri].gsub!(/\/+$/, '').concat('/')
    @username    = hparams[:username]
    @password    = hparams[:password]
    @api_key     = hparams[:api_key]
    @resource    = hparams[:get]
    @redmine_uri = URI(tmp_uri + "%s.json" % @resource)
  end

  # Fetch the information from the Redmine tracker.
  # @return JSON containing the information that was requested. 
  def fetch!
    if    !@api_key.nil?  || @api_key  != "" then 
      fetch_by_api_key
    elsif !@password.nil? || @password != "" ||
          !@username.nil? || @username != "" then 
      fetch_by_username_and_password
    end
  end

  attr_accessor :api_key, :username, :password

private

  # Provide the API to the REST resource and get info
  # @return String JSON string of the data requested
  def fetch_by_api_key
    Net::HTTP.start(@redmine_uri.host, @redmine_uri.port) do |http|
      req = Net::HTTP::Get.new(@redmine_uri.request_uri)
      # Set the user authentication API key
      req[Psymine::Rest::HttpHeader] = @api_key
      response = http.request req
    end
    response.body
  end

  # Provide the username and password to the service using the Http headers
  # to send said information. (IMHO you should just use the API key; this 
  # method exists here if the provider does not allow you to use an API key for
  # whatever twisted reason at that).
  def fetch_by_username_and_password
    raise NotImplemented, "This might make an appearance later..."
  end
end
end # module Psymine

