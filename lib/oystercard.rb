class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

attr_reader :balance, :entry_station, :exit_station, :trip_history


def initialize
  @balance = 0
  @entry_station = nil
  @exit_station = nil
  @trip_history = []

end

def top_up(value)
  raise "Maximum Balance of #{MAXIMUM_BALANCE} Reached" if (@balance + value) > MAXIMUM_BALANCE
  @balance += value
end

def touch_in(entry_station)
  raise "Insufficient Funds" if @balance < MINIMUM_BALANCE
  @in_use = true
  @entry_station = entry_station
end

def touch_out(exit_station)
  @in_use = false
  deduct(MINIMUM_BALANCE)
  @exit_station = exit_station
  add_trip_history

  @entry_station = nil
end

def in_journey?
  !!@entry_station
end

private

def deduct(value)
  @balance -= value
end

def add_trip_history
  @trip_history << {entry_station: @entry_station, exit_station: @exit_station}
end

end
