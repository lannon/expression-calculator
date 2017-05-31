class CalculatorsController < ApplicationController
  def new
    @results = calculate
  end

  Results = Struct.new(:input, :output)

  def calculate
    if params[:input].present?
      Results.new(params[:input],
                  params[:input])
    end
  end
end
