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

  describe "when input has a single number" do 

    it "returns that same number" do 
      expect(@calculator.add("4")).to eq(4)
    end

  end

  describe "wwhen input has multiple numbers separated by commas" do

    it "return the sum of all numbers" do
      expect(@calculator.add("1,2,3,4")).to eq(10)
    end

  end

  describe "when input contains newline characters" do 

    it "handles numbers separated by commas and newlines" do 
      expect(@calculator.add("1,2,3\n4")).to eq(10)
    end

    it "handles single number followed by newline" do 
      expect(@calculator.add("1\n")).to eq(1)
    end

    it "returns 0 when input is only a newline" do 
      expect(@calculator.add("\n")).to eq(0)
    end

  end

  describe "when input includes negative numbers" do 

    it "raises an error when a single negative number is given" do
      expect{ @calculator.add("-1,2,3") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
    end

    it "raises an error listing all negative numbers when multiple negatives are given" do
      input = "-1,-2,3"
      expected_message = "negative numbers not allowed -1,-2"
        expect { @calculator.add(input) }.to raise_error(RuntimeError) do |error|
        expect(error.message).to eq(expected_message)
      end 
    end

  end

  describe "when custom delimiter is provided" do 
    it "uses the custom delimiter and returns the correct sum" do 
      expect(@calculator.add("//;\n1;2;3")).to eq(6)
    end
  end

  describe "when counting the number of times #add method is called" do 
    it "tracks the total add method invocation count" do 
      calculator = StringCalculator.new()
      calculator.add("")
      calculator.add("1")
      calculator.add("1,2,3")
      expect(calculator.count_add).to eq (3)
    end
  end

  describe "when input is invalid or unexpected" do 
    it "returns 0 for nil input" do
        expect(@calculator.add(nil)).to eq(0)
    end

    it "treats invalid strings as 0 and sums remaining valid numbers" do
        expect(@calculator.add("a,b,3")).to eq(3)
    end

    it "handles multiple commas gracefully" do
      expect(@calculator.add("1,,2,3")).to eq(6)
    end

    it "handles spaces in input" do
      expect(@calculator.add("1, 2,3")).to eq(6)
    end
  end
end