class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FEE = 1
  attr_reader :in_use, :min_fee, :deduct, :entry_station, :exit_station, :journeys
  attr_accessor :balance
  def initialize
    @min_fee = MINIMUM_FEE
    @balance = 0
    @in_use = false
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE } exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
   @in_use
  end

  def touch_in(station)
    raise "You do not have enough money!" if balance < min_fee
    @in_use = true
    @entry_station = station
  end


  def touch_out(station)
    deduct(min_fee)
    @exit_station = station
    journey_log(entry_station,exit_station)
    @in_use = false
  end

  def journey_log(entry_station, exit_station)
    journey = {entry_station: entry_station, exit_station: exit_station}
    journeys << journey
  end

  private

  def deduct(fee = min_fee)
    @balance -= fee
  end
end