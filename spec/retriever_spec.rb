require 'spec_helper'
require 'psymine'
require 'psymine/technical/retriever.rb'

include Psymine::Technical

describe Retriever do
  it "should raise not hash PsymineException on init" do
    expect{Retriever.new(:im_a_b_b_bad_b_b_b_boy)}.to \
      raise_error(TechnicalException, "hparams is not a hash")
    expect{Retriever.new(12312)}.to \
      raise_error(TechnicalException, "hparams is not a hash")
    expect{Retriever.new("123123alsjkdlajsdl")}.to \
      raise_error(TechnicalException, "hparams is not a hash")
    expect{Retriever.new(123.123)}.to \
      raise_error(TechnicalException, "hparams is not a hash")
    expect{Retriever.new(Object)}.to \
      raise_error(TechnicalException, "hparams is not a hash")
  end

  it "should accept :username, :password in init" do
    expect{Retriever.new({:username => "jon", :password => "doe", :uri => "a"}\
      )}.to_not raise_error(TechnicalException)
  end

  it "must have a uri specified" do
    expect{Retriever.new({:api_key => "derp", :uri => ""})}.to \
      raise_error(TechnicalException)

    expect{Retriever.new({:api_key => "derp", :uri => nil})}.to \
      raise_error(TechnicalException)

    expect{Retriever.new({:api_key => "derp"})}.to \
      raise_error(TechnicalException)
  end

  it "should accept :api_key" do
    expect{Retriever.new({:api_key => "derp", :uri => "a"})}.to_not \
      raise_error(TechnicalException)
  end

  it "should not accept blank :api_key" do
    expect{Retriever.new({:api_key => "", :uri => "a"})}.to \
      raise_error(TechnicalException,"API key cannot be blank")
    expect{Retriever.new({:api_key => nil, :uri => "a"})}.to \
      raise_error(TechnicalException, "API key cannot be blank")
  end

  it "must have username AND password" do
    expect{Retriever.new({:username => "jon", :password => "", :uri => "a"})}.to \
      raise_error(TechnicalException, "You need to specify both credentials")
    expect{Retriever.new({:username => "", :password => "jon", :uri => "a"})}.to \
      raise_error(TechnicalException, "You need to specify both credentials")
    expect{Retriever.new({:username => "", :password => "", :uri => "a"})}.to \
      raise_error(TechnicalException, "You need to specify both credentials")
  end
end
