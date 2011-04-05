module TravelAgent
  class RouteFinder
    
    def find_fastest(current_airport, destination_name, current_time = Time.parse('00:00'))
      # If we're at the destination, we're done!
      return [current_time, current_time, 0] if current_airport.name == destination_name
      
      @already_visited ||= []
      @already_visited << current_airport.name
      
      fastest_depart_at, fastest_arrive_at, fastest_cost = nil
      
      current_airport.flights.each do |flight|
        # If we have already been to this airport, skip it (no loops)
        next if @already_visited.include?(flight.destination.name)
        # If we have missed this flight, skip it
        next if current_time > flight.departs_at
        
        depart_at, arrive_at, cost = find_fastest(flight.destination, destination_name, flight.arrives_at)
        cost += flight.price
        
        # If we didn't find a route to the destination, ignore this flight
        unless arrive_at.nil?
          if fastest_arrive_at.nil? || arrive_at < fastest_arrive_at
            fastest_depart_at = flight.departs_at
            fastest_arrive_at = arrive_at
            fastest_cost = cost
          elsif arrive_at == fastest_arrive_at && cost < fastest_cost
            fastest_cost = cost
          end
        end
        
      end
      
      @already_visited.pop # Remove this airport from the visited list
      
      fastest_depart_at, fastest_arrive_at, fastest_cost
    end
    
    def find_cheapest(start_node, destination)
    end
    
  end
end