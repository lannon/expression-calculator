require "bigdecimal"

module Calculator
  class Token < Struct.new(:type, :value)

    INTEGER        = :integer
    ADDITION       = :addition
    SUBTRACTION    = :subtraction
    MULTIPLICATION = :multiplication
    DIVISION       = :division
    EOF            = :eof

    OPERATOR_MAP= {
      "+" => ADDITION,
      "-" => SUBTRACTION,
      "*" => MULTIPLICATION,
      "/" => DIVISION
    }

    # convenience methods for explicitly accessing
    # token types in other contexts, e.g.,
    #
    # > Calculator::Token.addition
    # => :addition
    #
    class << self
      [ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION, INTEGER].each do |type|
        define_method(type) do
          type
        end
      end
    end

    def self.tokenize(t)
      case 
      when t =~ /\d+/
        Token.new(INTEGER, BigDecimal.new(t.to_i))
      when t =~ /[+-\/*]/
        Token.new(OPERATOR_MAP[t], t)
      else
        Token.new(EOF, nil)
      end
    end
  end
end
