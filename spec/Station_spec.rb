require './lib/station'

require 'station'

describe Station do
  subject(:station) {described_class.new("London Victoria", 1)}
  it "name method calls its name" do
    expect(station.name).to eq("London Victoria")
  end

  it "knows its zone" do
    expect(station.zone).to eq(1)
  end

end
