class Oystercard

MAXIMUM_BALANCE = 90

attr_reader :balance

def initialize
  @balance = 0
end

def top_up(value)
  raise "Maximum Balance of #{MAXIMUM_BALANCE} Reached" if (@balance + amount) > MAXIMUM_BALANCE
  @balance += value
end

def deduct(value)
  @balance -= value
end

def touch_in
  raise "Insufficient Funds" if @balance < 1
  @in_use = true
end

def touch_out
  @in_use = false
end

def in_journey?
  @in_use
end
end
