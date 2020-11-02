require './lib/oystercard'

describe Oystercard do
  it "Default balance starts at 0" do
    expect(subject.balance).to eq 0
  end
describe '#top_up' do
  it "Responds to Top_up method" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  it "Add money to the card" do
    expect{ subject.top_up 1 }.to change { subject.balance }.by 1
  end
  it "Raise an error when balance exceeds 90" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1}.to raise_error "Limit Reached"
  end
end
describe '#deduct' do
  it "Responds to deduct method with one argument" do
    expect(subject).to respond_to(:deduct).with(1).argument
  end
  it "Deducts the overall balance by certain value" do
    subject.top_up(2)
    expect{ subject.deduct 1}.to change {subject.balance }.by -1
  end
end
end
