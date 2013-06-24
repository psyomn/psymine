module Psymine::Domain
# @author  Simon Symeonidis
# @license GPL v3.0
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
