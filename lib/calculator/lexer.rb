require 'calculator/token'

module Calculator
  class Lexer
    TOKEN_REGEXP  = /(\d+|\D)/

    def initialize(input)
      @input = input
      @pos   = 0
    end

    def next
      tokens[@pos].tap do
        @pos += 1
      end
    end

    def tokens
      return @tokens if defined?(@tokens)
      lexemes.map {|t| Token.tokenize(t) }
    end

    private

    def lexemes
      @input.scan(TOKEN_REGEXP).flatten.push(nil)
    end
  end
end
