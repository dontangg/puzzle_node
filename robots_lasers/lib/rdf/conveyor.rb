module RDF
  class Conveyor
    attr_accessor :north_lasers, :south_lasers, :robot_location
    
    def initialize
      @north_lasers = []
      @south_lasers = []
      @robot_location = 0
    end
    
    def path_of_least_damage
      # First we'll check east
      east_north_lasers = @north_lasers[@robot_location...@north_lasers.size]
      east_south_lasers = @south_lasers[@robot_location...@north_lasers.size]
      
      # east_north_lasers, east_south_lasers = east_south_lasers, east_north_lasers if (@robot_location % 2) == 1
      east_damage = assess_damage(east_north_lasers, east_south_lasers)
      
      # Next we'll check west
      west_north_lasers = @north_lasers[0..@robot_location].reverse
      west_south_lasers = @south_lasers[0..@robot_location].reverse
      
      # west_north_lasers, west_south_lasers = east_south_lasers, west_south_lasers if (@robot_location % 2) == 1
      west_damage = assess_damage(west_north_lasers, west_south_lasers)
      
      east_damage < west_damage ? :east : :west
    end
    
    private
    
    def assess_damage(north_lasers, south_lasers)
      # north fires on even clicks, south fires on odd clicks... the first click is 0 (even)
      damage = 0
      north_lasers.each_index do |i|
        if (i % 2) == 0
          damage += 1 if north_lasers[i]
        else
          damage += 1 if south_lasers[i]
        end
      end
      
      damage
    end
    
  end
end