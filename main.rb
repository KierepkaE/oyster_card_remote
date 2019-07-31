require_relative 'lib/station.rb'
require_relative 'lib/oystercard.rb'

station_database = {}

station_database['Oxford Circus'] = Station.new('Oxford Circus', 1)
station_database['Angel'] = Station.new('Angel', 1)
station_database['Angel'] = Station.new('Charing Cross', 2)
station_database['Angel'] = Station.new('Sloane Square', 3)
station_database['Angel'] = Station.new('Kensington', 4)
station_database['Angel'] = Station.new('Barking', 5)
station_database['Angel'] = Station.new('Golder Green', 6)

oystercard = Oystercard.new
oystercard.top_up 20
puts "My new oystercard has a balance of #{oystercard.balance}"
oystercard.touch_in(station_database['Angel'])
oystercard.touch_out(station_database['Oxford Circus'])
puts "My new oystercard now has a balance of #{oystercard.balance}"

oystercard.touch_in(station_database['Golders Green'])
oystercard.touch_out(station_database['Barking'])
puts "My new oystercard now has a balance of #{oystercard.balance}"

