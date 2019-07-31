class Journey

  PENALTY_FARE = 1

  attr_reader :fare, :complete, :start_station, :end_station
  def initialize
    @fare = PENALTY_FARE
    @complete = false
    @start_station = nil
    @end_station = nil
  end

  def complete?
    @complete
  end

  def fare(fee = PENALTY_FARE)
    fare = fee
  end

  def finish(station)
    @end_station
    self
  end

  def entry_station(station)
    @start_station = station
  end



end