require 'spec_helper'
require 'calculator/lexer'

describe Calculator::Lexer do
  let(:expression) { "5*3+1+6/2+9*100"                 }
  let(:lexer)      { Calculator::Lexer.new(expression) }

  describe "#tokens" do
    it "breaks expression into appropriate tokens" do
      expect(lexer.tokens[0]).to  eq(Calculator::Token.tokenize("5"))
      expect(lexer.tokens[1]).to  eq(Calculator::Token.tokenize("*"))
      expect(lexer.tokens[2]).to  eq(Calculator::Token.tokenize("3"))
      expect(lexer.tokens[3]).to  eq(Calculator::Token.tokenize("+"))
      expect(lexer.tokens[4]).to  eq(Calculator::Token.tokenize("1"))
      expect(lexer.tokens[5]).to  eq(Calculator::Token.tokenize("+"))
      expect(lexer.tokens[6]).to  eq(Calculator::Token.tokenize("6"))
      expect(lexer.tokens[7]).to  eq(Calculator::Token.tokenize("/"))
      expect(lexer.tokens[8]).to  eq(Calculator::Token.tokenize("2"))
      expect(lexer.tokens[9]).to  eq(Calculator::Token.tokenize("+"))
      expect(lexer.tokens[10]).to eq(Calculator::Token.tokenize("9"))
      expect(lexer.tokens[11]).to eq(Calculator::Token.tokenize("*"))
      expect(lexer.tokens[12]).to eq(Calculator::Token.tokenize("100"))
    end

    it "appends an EOF token" do
      expect(lexer.tokens.last).to eq(Calculator::Token.new(:eof, nil))
    end
  end

  describe "#next" do
    it "skips to next token" do
      expect(lexer.next).to eq(Calculator::Token.tokenize("5"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("*"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("3"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("+"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("1"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("+"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("6"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("/"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("2"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("+"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("9"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("*"))
      expect(lexer.next).to eq(Calculator::Token.tokenize("100"))
    end
  end
end
