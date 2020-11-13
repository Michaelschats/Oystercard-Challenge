require 'Player'

describe Player do
  subject(:michael) { Player.new('Michael') }
  it "return the name of Player" do
    expect(subject.name).to eq 'Michael'
  end
end
