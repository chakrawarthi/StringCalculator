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

  describe "when given values with new line \"\\n\"" do 

    it "return the sum of values" do 
      expect(@calculator.add("1,2,3\n4")).to eq(10)
    end

    it "return the sum of values" do 
      expect(@calculator.add("1\n")).to eq(1)
    end

    it "check with only new line" do 
      expect(@calculator.add("\n")).to eq(0)
    end

  end

  describe "when given - values" do 

    it "when given only one - value" do
      expect{ @calculator.add("-1,2,3") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
    end

    it "when given multiple - values" do
      input = "-1,-2,3"
      expected_message = "negative numbers not allowed -1,-2"
        expect { @calculator.add(input) }.to raise_error(RuntimeError) do |error|
        expect(error.message).to eq(expected_message)
      end 
    end

  end

end