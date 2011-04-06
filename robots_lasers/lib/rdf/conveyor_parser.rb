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

        # Create a line of lasers
        north_lasers = []
        line.each_char do |c|
          if c == '#'
            north_lasers << 0
          else
            north_lasers << 1
          end
        end
        
        # Get the robot location
        line = file.gets.strip
        robot_loc = 0
        line.each_char do |c|
          break if c == 'X'
          robot_loc += 1
        end

        # Create another line of lasers
        south_lasers = []
        line.each_char do |c|
          if c == '#'
            south_lasers << 0
          else
            south_lasers << 1
          end
        end

      end
    end

  end
end
