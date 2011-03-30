module TravelAgent
  class Flight
    attr_accessor :source, :destination, :departs_at, :arrives_at, :price
  
  #  def initialize
  #    
  #  end
  
    def duration
      @arrives_at - @departs_at
    end
  end
end