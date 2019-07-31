class Journey

  PENALTY_FARE = 1

  attr_reader :fare, :complete, :stations

  def initialize(station)
    @fare = PENALTY_FARE
    @complete = false
    @stations = [station]
  end

  def complete?
    @complete
  end

  def fare(fee = PENALTY_FARE)
    fare = fee
  end

  def add_station(station)

  end

  def finish(station)
    stations << station
    @complete = true
    @fare
  end
end