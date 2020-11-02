require './lib/oystercard'

describe Oystercard do
  it "Default balance starts at 0" do
    expect(subject.balance).to eq 0
  end
end
