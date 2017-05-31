require 'spec_helper'
require 'calculator'

describe Calculator do
  let(:input_one) { "5*3+1+6/2+9*100"  }
  let(:input_two) { "5*3+1+6/85+9*100" }

  it "handles input one" do
    expect(described_class.calculate(input_one)).to eq(919)
  end

  it "handles input two" do
    expect(described_class.calculate(input_two)).to eq(916.07)
  end
end
