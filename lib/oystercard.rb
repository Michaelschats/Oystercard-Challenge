class Oystercard
attr_reader :balance
def initialize
  @balance = 0
end
def top_up(value)
  raise "Limit Reached" if (@balance + value) > 90
  @balance += value
end
end
