require 'spec_helper'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do 

  before(:each) do 
    @calculator = StringCalculator.new()
  end

  describe "when given an empty string" do 

    it "return 0" do 
      expect(@calculator.add("")).to eq(0)
    end

  end

  describe "when given only one value" do 

    it "return same value" do 
      expect(@calculator.add("4")).to eq(4)
    end

  end

  describe "when given values with ',' saperation" do

    it "return the sum of values" do
      expect(@calculator.add("1,2,3,4")).to eq(10)
    end

  end

end