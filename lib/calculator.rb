require 'calculator/lexer'
require 'calculator/parser'
require 'calculator/token'

module Calculator
  def self.calculate(expression)
    Calculator::Parser.new(
      Calculator::Lexer.new(expression)
    ).expr.round(2).to_f
  end
end
