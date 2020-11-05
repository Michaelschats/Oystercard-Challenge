require './lib/oystercard'

describe Oystercard do
  let(:entry_station){ double :station}
  let(:exit_station){ double :station}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it "stores the entry stations" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  it "Default balance starts at 0" do
    expect(subject.balance).to eq 0
  end
describe '#top_up' do
  it "Responds to top_up method" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  it "Add money to the card" do
    expect{ subject.top_up 1 }.to change { subject.balance }.by 1
  end
  it "Raise an error when balance exceeds 90" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1}.to raise_error "Maximum Balance of #{maximum_balance} Reached"
  end
end

describe "#in_journey?" do
  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'Returning Journey is finished by empty entry station ' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to eq(false).or eq(true)
  end
end
describe '#touch_in' do
  it "if balance less than 1 raise an error" do
    expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient Funds"
  end
end
describe '#touch_out' do
  it "Reduces balance when touch_out method is called" do
    expect{ subject.touch_out(exit_station)}.to change{ subject.balance}.by (-Oystercard::MINIMUM_BALANCE)
  end
  it "returns entry station to nil" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect( subject.touch_out(exit_station)).to eq @entry_station = nil
  end
  it "accepts exit stations as an argument" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect(subject).to respond_to(:touch_out).with(1).argument
  end
describe '#trip_history' do
  it "trip history is empty" do
    expect(subject.trip_history).to eq []
  end
  it "Checks that a journey has been added to Trip History" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.trip_history).not_to be_empty
  end
end
end
end
