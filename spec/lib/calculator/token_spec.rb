require 'spec_helper'
require 'calculator/token'

describe Calculator::Token do
  describe ".tokenize" do
    it "creates an integer token when called with an integer" do
      token = described_class.tokenize("5")
      expect(token.type).to eq(:integer)
      expect(token.value).to eq(5)
    end

    it "creates an addition token when called with +" do
      token = described_class.tokenize("+")
      expect(token.type).to eq(:addition)
      expect(token.value).to eq("+")
    end

    it "creates a subtraction token when called with +" do
      token = described_class.tokenize("-")
      expect(token.type).to eq(:subtraction)
      expect(token.value).to eq("-")
    end

    it "creates a multiplication token when called with *" do
      token = described_class.tokenize("*")
      expect(token.type).to eq(:multiplication)
      expect(token.value).to eq("*")
    end

    it "creates a division token when called with /"do
      token = described_class.tokenize("/")
      expect(token.type).to eq(:division)
      expect(token.value).to eq("/")
    end

    it "creates an EOF token when called with nil" do
      token = described_class.tokenize(nil)
      expect(token.type).to eq(:eof)
      expect(token.value).to eq(nil)
    end

    it "creates an EOF token when called with empty string" do
      token = described_class.tokenize("")
      expect(token.type).to eq(:eof)
      expect(token.value).to eq(nil)
    end
  end
end
