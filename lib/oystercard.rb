require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FEE = 1
  attr_reader :min_fee, :deduct,  :journeys
  attr_accessor :balance
  def initialize
    @min_fee = MINIMUM_FEE
    @balance = 0
    @current_journey = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE } exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
   @current_journey != nil
  end

  def touch_in(station)
    raise "You do not have enough money!" if balance < min_fee
    raise 'You are already travelling' if in_journey?
    @current_journey = Journey.new(station)
  end

  def touch_during(station)
    raise "You aren't in the middle of a journey" unless in_journey?

    @current_journey.touch_during station
  end

  def touch_out(station)
    deduct(@current_journey.finish(station))
    journey_log(@current_journey)
    @current_journey = nil
  end

  def journey_log(journey)
    journeys << journey
  end

  private

  def deduct(fee = min_fee)
    @balance -= fee
  end

end