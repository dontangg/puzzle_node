require 'time'

module TravelAgent
  class RouteFinder
    
    def find_fastest(current_airport, destination_name, current_time = nil)
      # If we're at the destination, we're done!
      return [current_time, current_time, 0] if current_airport.name == destination_name
      
      @already_visited ||= []
      @already_visited << current_airport.name
      
      fastest_start_at, fastest_arrive_at, fastest_cost = nil
      
      current_airport.flights.each do |flight|
        # If we have already been to this airport, skip it (no loops)
        next if @already_visited.include?(flight.destination.name)
        # If we have missed this flight, skip it
        next if (current_time || Time.parse('00:00')) > flight.departs_at
        
        start_at, arrive_at, cost = find_fastest(flight.destination, destination_name, flight.arrives_at)
        
        # If we didn't find a route to the destination, ignore this flight
        unless arrive_at.nil?
          cost += flight.price
          effective_start_time = current_time.nil? ? flight.departs_at : current_time
          
          # If this is the only arrival then it is currently the fastest
          # Otherwise, we check to see if total airport/airplane time for this route is less than total airport/airplane time for fastest
          if fastest_arrive_at.nil? || (arrive_at - effective_start_time) < (fastest_arrive_at - fastest_start_at)
            fastest_start_at = effective_start_time
            fastest_arrive_at = arrive_at
            fastest_cost = cost
          elsif (arrive_at - effective_start_time) == (fastest_arrive_at - fastest_start_at) && cost < fastest_cost
            # If the airplane/airport time is equal, take the cheaper flight
            fastest_cost = cost
          end
        end
        
      end
      
      @already_visited.pop # Remove this airport from the visited list
      
      [fastest_start_at, fastest_arrive_at, fastest_cost]
    end
    
    def find_cheapest(current_airport, destination_name, current_time = nil)
      # If we're at the destination, we're done!
      return [current_time, current_time, 0] if current_airport.name == destination_name
      
      @already_visited ||= []
      @already_visited << current_airport.name
      
      cheapest_start_at, cheapest_arrive_at, cheapest_cost = nil
      
      current_airport.flights.each do |flight|
        # If we have already been to this airport, skip it (no loops)
        next if @already_visited.include?(flight.destination.name)
        # If we have missed this flight, skip it
        next if (current_time || Time.parse('00:00')) > flight.departs_at
        
        start_at, arrive_at, cost = find_cheapest(flight.destination, destination_name, flight.arrives_at)
        
        # If we didn't find a route to the destination, ignore this flight
        unless arrive_at.nil?
          cost += flight.price
          effective_start_time = current_time.nil? ? flight.departs_at : current_time
          
          # If this is the only arrival then it is currently the cheapest
          # Otherwise, we check to see if total airport/airplane time for this route is less than total airport/airplane time for cheapest
          if cheapest_arrive_at.nil? || cost < cheapest_cost
            cheapest_start_at = effective_start_time
            cheapest_arrive_at = arrive_at
            cheapest_cost = cost
          elsif cost == cheapest_cost && (arrive_at - effective_start_time) < (cheapest_arrive_at - cheapest_start_at)
            # If the airplane/airport cost is equal, take the faster flight
            cheapest_start_at = effective_start_time
            cheapest_arrive_at = arrive_at
          end
        end
        
      end
      
      @already_visited.pop # Remove this airport from the visited list
      
      [cheapest_start_at, cheapest_arrive_at, cheapest_cost]
    end
    
  end
end
