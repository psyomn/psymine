require 'net/http'
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
    raise TechnicalException, "hparams is not a hash" unless hparams.is_a? Hash

  end

  # Fetch the information from the Redmine tracker.
  # @return JSON containing the information that was requested. 
  def fetch!
  end

  attr_accessor :api_key

end
end # module Psymine

