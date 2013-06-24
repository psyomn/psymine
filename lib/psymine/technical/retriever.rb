require 'net/http'
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
  #   Initialize like this: Retriever.new({:user => '...', :password => '...'})
  #   for using the interface with only username and password. 
  # 
  # @example Connecting with API generated Key
  #   Initialize like this: Retriever.new({:api => '...'}) providing the api 
  #   key if that is the prefered method of API usage.
  # 
  # @params hparams are the hash values passed that are used accordingly in
  #   order to initialize the retriever (and make it understand how to 
  #   interface with redmine).
  def initialize(hparams)
    # Asserts!
    check_if_properly_initialized(hparams)

    # Main init
  end

  # Fetch the information from the Redmine tracker.
  # @return JSON containing the information that was requested. 
  def fetch!
  end

  attr_accessor :api_key, :username, :password

private

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

