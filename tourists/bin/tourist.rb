require 'travel_agent'

if ARGV.length < 1
  puts "usage: ruby #{__FILE__} [input_file.txt]"
  Process.exit
end

unless File.exists?(ARGV[0])
  puts "File doesn't exist: #{ARGV[0]}"
  Process.exit
end

start_airports = TravelAgent::FlightParser.parse(ARGV[0])

route_finder = TravelAgent::RouteFinder.new

start_airports.each do |airport|
  cheapest = route_finder.find_cheapest(airport, 'Z')
  puts "#{cheapest[0].strftime('%H:%M')} #{cheapest[1].strftime('%H:%M')} #{'%.2f' % cheapest[2]}"
  
  fastest = route_finder.find_fastest(airport, 'Z')
  puts "#{fastest[0].strftime('%H:%M')} #{fastest[1].strftime('%H:%M')} #{'%.2f' % fastest[2]}"
  puts
  
end