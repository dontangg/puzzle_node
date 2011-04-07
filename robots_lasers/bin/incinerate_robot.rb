
if ARGV.size < 1
  puts "usage: ruby #{__FILE__} [input.txt]"
  Process.exit
end

unless File.exists?(ARGV[0])
  puts "File doesn't exist: #{ARGV[0]}"
  Process.exit
end

require 'rdf'

conveyors = RDF::ConveyorParser.parse(ARGV[0])

conveyors.each do |conveyor|
  if conveyor.path_of_least_damage == :east
    puts "GO EAST"
  else
    puts "GO WEST"
  end
end

