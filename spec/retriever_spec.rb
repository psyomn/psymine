require 'spec_helper'
require 'psymine'
require 'psymine/technical/retriever.rb'

include Psymine::Technical

describe Retriever do
  it "should raise not hash PsymineException on init" do
    expect{Retriever.new(:im_a_b_b_bad_b_b_b_boy)}.to \
      raise_error(TechnicalException, "hparams is not a hash")
  end
end
