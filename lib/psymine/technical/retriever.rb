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
    # Asserts!
    check_if_properly_initialized(hparams)
    @username    = hparams[:username]
    @password    = hparams[:password]
    @api_key     = hparams[:api_key]
    @resource    = hparams[:get]
    @redmine_uri = URI(hparams[:uri] + "%s.json" % @resource)
    # Main init
  end

  # Fetch the information from the Redmine tracker.
  # @return JSON containing the information that was requested. 
  def fetch!
    if    !@api_key.nil?  || @api_key  != "" then 
      fetch_by_api_key
    elsif !@password.nil? || @password != "" ||
          !@username.nil? || @username != "" then 
      fetch_by_username_and_password
    else
      raise "You have found a bug. Please contact the gem author with this"\
        " information"
    end
  end

  attr_accessor :api_key, :username, :password

private

  # Provide the API to the REST resource and get info
  # @return TODO stuff
  def fetch_by_api_key
    response = nil
    Net::HTTP.start(@redmine_uri.host, @redmine_uri.port) do |http|
      req = Net::HTTP::Get.new(@redmine_uri)
      
      # Set the user authentication API key
      req[Psymine::Rest::HttpHeader] = @api_key
      response = http.request req
    end
    response
  end

  # Provide the username and password to the service using the Http headers
  # to send said information. (IMHO you should just use the API key; this 
  # method exists here if the provider does not allow you to use an API key for
  # whatever twisted reason at that).
  def fetch_by_username_and_password
    raise NotImplemented, "This might make an appearance later..."
  end


  # Checks to see if everything was properly initialized
  # @hparams are the params passed to the constructor
  def check_if_properly_initialized(hparams)
    # It MUST be a hash
    raise TechnicalException, "hparams is not a hash" unless hparams.is_a? Hash

    # It MUST have a URI
    if (hparams[:uri].nil? || hparams[:uri] == "") then
      raise TechnicalException, "need a URI" 
    end
    
    if hparams[:get].nil? # It must have a :get param
      raise TechnicalException, "need a Symbol for resource request" 
    else # It must have an acknowleged symbol
      known = [:issues, :projects]
      unless known.member? hparams[:get]
        raise TechnicalException, "Do not know resource '%s'" % hparams[:get]
      end
    end

    if (hparams[:api_key].nil? || hparams[:api_key] == "")  &&
       ((hparams.keys & [:username, :password]).count == 0) && 
       (hparams[:username].nil?) then
      raise TechnicalException, "API key cannot be blank"
    end

    if (hparams[:username].nil? || hparams[:username] == ""   ||
        hparams[:password].nil? || hparams[:password] == "" ) && 
        hparams[:api_key].nil? then
      raise TechnicalException, "You need to specify both credentials"
    end

  end

end
end # module Psymine

