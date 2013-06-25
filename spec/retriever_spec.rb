require 'spec_helper'
require 'psymine'
require 'psymine/technical/retriever.rb'

include Psymine::Technical

describe Retriever do

  it "should raise not hash PsymineException on init" do
    expect{
      Retriever.new(:im_a_b_b_bad_b_b_b_boy)}.to \
      raise_error(TechnicalException, "hparams is not a hash")

    expect{
      Retriever.new(12312)}.to \
      raise_error(TechnicalException, "hparams is not a hash")

    expect{
      Retriever.new("123123alsjkdlajsdl")}.to \
      raise_error(TechnicalException, "hparams is not a hash")

    expect{
      Retriever.new(123.123)}.to \
      raise_error(TechnicalException, "hparams is not a hash")

    expect{
      Retriever.new(Object)}.to \
      raise_error(TechnicalException, "hparams is not a hash")
  end

  it "should accept :username, :password in init" do
    expect{
      Retriever.new({:username => "jon", :password => "doe", 
        :uri => "a", :get => :issues})}.to_not raise_error(TechnicalException)
  end

  it "must have a uri specified" do
    expect{
      Retriever.new({:api_key => "derp", :uri => "", :get => :issues})}.to \
      raise_error(TechnicalException)

    expect{
      Retriever.new({:api_key => "derp", :uri => nil, :get => :issues})}.to \
      raise_error(TechnicalException)

    expect{
      Retriever.new({:api_key => "derp", :get => :issues})}.to \
      raise_error(TechnicalException)
  end

  it "should accept :api_key" do
    expect{
      Retriever.new({:api_key => "derp", 
      :uri => "a", :get => :issues})}.to_not \
      raise_error(TechnicalException)
  end

  it "should not accept blank :api_key" do
    expect{
      Retriever.new({:api_key => "", :uri => "a", :get => :issues})}.to \
      raise_error(TechnicalException,"API key cannot be blank")
    expect{
      Retriever.new({:api_key => nil, :uri => "a", :get => :issues})}.to \
      raise_error(TechnicalException, "API key cannot be blank")
  end

  it "must have username AND password" do
    expect{
      Retriever.new({:username => "jon", :password => "", 
        :uri => "a", :get => :issues})}.to \
      raise_error(TechnicalException, "You need to specify both credentials")

    expect{
      Retriever.new({:username => "", :password => "jon", 
        :uri => "a", :get => :issues})}.to \
      raise_error(TechnicalException, "You need to specify both credentials")

    expect{
      Retriever.new({:username => "", :password => "", 
        :uri => "a", :get => :issues})}.to \
      raise_error(TechnicalException, "You need to specify both credentials")
  end

  it "must accept resource type request for :get of :issues, :projects" do
    expect{
      Retriever.new({:api_key => "abcdef", 
      :uri => "a", :get => :issues, :get => :issues})}.to_not \
      raise_error(TechnicalException)

    expect{
      Retriever.new({:api_key => "abcdef", 
      :uri => "a", :get => :projects, :get => :issues})}.to_not \
      raise_error(TechnicalException)
  end

  it "must raise errors on type request for :get of :garbageajsdkajsdkj" do
    expect{
      Retriever.new({:api_key => "abcdef", 
      :uri => "a", :get => :ASDaalksjdlajksdlq})}.to \
      raise_error(TechnicalException)
  end
end

