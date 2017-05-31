require 'calculator'

class CalculatorsController < ApplicationController
  def new
    @results = calculate
  end

  Results = Struct.new(:input, :output)

  def calculate
    if params[:input].present?
      Results.new(params[:input],
                  Calculator.calculate(params[:input]))
    end
  end
end
