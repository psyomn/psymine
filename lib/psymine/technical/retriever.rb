require 'open-uri'
require 'net/http'

# lib
require 'psymine/technical/technical_exception'

module Psymine::Technical
# @author  Simon Symeonidis
# @license GPL v3.0
# @date    Sun Jun 23 13:39:41 EDT 2013
# This is a helper class that will build the request with appropriate headers
# and send it to the foreign redmine repo. It is also responsible returning the
# appropriate JSON.
class Retriever

  # @example Connecting with Username and Password 
  #   ret = Retriever.new({:user => '...', :password => '...'})
  #   ret.fetch!
  #
  # @example Connecting with API generated Key
  #   ret = Retriever.new({:api => '...'}) 
  #   ret.fetch!
  # 
  # @params hparams are the hash values passed that are used accordingly in
  #   order to initialize the retriever (and make it understand how to 
  #   interface with redmine).
  def initialize(hparams)
    # Asserts!
    check_if_properly_initialized(hparams)
    @username = hparams[:username]
    @password = hparams[:password]
    @api_key  = hparams[:api_key]
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
  def fetch_by_api_key
    
  end

  # Provide the username and password to the service using the Http headers
  # to send said information. (IMHO you should just use the API key).
  def fetch_by_username_and_password
  end


  # Checks to see if everything was properly initialized
  # @hparams are the params passed to the constructor
  def check_if_properly_initialized(hparams)
    raise TechnicalException, "hparams is not a hash" unless hparams.is_a? Hash

    if (hparams[:username].nil? || hparams[:username] == ""   ||
        hparams[:password].nil? || hparams[:password] == "" ) &&
       !(hparams.keys.member? :api_key) then
      raise TechnicalException, "You need to specify both credentials"
      return
    end

    if (hparams[:api_key].nil? || hparams[:api_key] == "")  &&
       ((hparams.keys & [:username, :password]).count == 0) then
      raise TechnicalException, "API key cannot be blank"
    end
  end

end
end # module Psymine

