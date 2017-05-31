require 'calculator/lexer'
module Calculator

  class Parser
    def initialize(lexer)
      @lexer = lexer
      @current_token = @lexer.next
    end

    def consume(token_type)
      if @current_token.type == token_type
        @current_token = @lexer.next
      else
        raise SyntaxError.new("Invalid input")
      end
    end

    def factor
      @current_token.value.tap do
        consume(Token.integer)
      end
    end

    def term
      result = factor
      while [Token.multiplication, Token.division].include?(@current_token.type)
        case @current_token.type
        when Token.multiplication
          consume(Token.multiplication)
          result = result * factor
        when Token.division
          consume(Token.division)
          result = result / factor
        end
      end
      result
    end

    def expr
      result = term
      while [Token.addition, Token.subtraction].include?(@current_token.type)
        case @current_token.type
        when Token.addition
          consume(Token.addition)
          result = result + term
        when Token.subtraction
          consume(Token.subtraction)
          result = result - term
        end
      end
      result
    end
  end
end
