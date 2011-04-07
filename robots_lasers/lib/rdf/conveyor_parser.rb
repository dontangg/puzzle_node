require 'rdf/conveyor'

module RDF
  class ConveyorParser

    def self.parse(filepath)
      file = File.new(filepath, 'r')

      # Create an array to store all the conveyors
      conveyors = []

      # Each loop in this while should result in one conveyor
      while line = file.gets
        # Go through any empty lines we may have
        while (line = file.gets.strip) == ""; end if line.strip == ""

        conveyor = Conveyor.new

        # Create a line of lasers
        line.chomp.each_char do |c|
          conveyor.north_lasers << (c == '#' ? nil : 1)
        end
        
        # Get the robot location
        line = file.gets.strip
        line.chomp.each_char do |c|
          break if c == 'X'
          conveyor.robot_location += 1
        end

        # Create another line of lasers
        line = file.gets.strip
        south_lasers = []
        line.chomp.each_char do |c|
          conveyor.south_lasers << (c == '#' ? nil : 1)
        end

        conveyors << conveyor
      end
      
      conveyors
    end

  end
end
