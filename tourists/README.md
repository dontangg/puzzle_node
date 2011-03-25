Cheap Tourist, Fast Tourist
===========================

Given a set of flight departures and arrivals, calculate the quickest route and
the cheapest route.

Usage
-----

    bin/find_routes.rb [input.txt]

Explanation
-----------

The first thing that I thought of when thinking about a solution to this was that
I needed to brush up on my pathfinding algorithms (A*, Dijkstra's algorithm, etc).
After relearning a couple of those, I realized that they won't work as is with our
airplane flights problem.

The algorithms all assume that if you take the least cost path to a node, that
you won't miss out on potential connections out of that node. In both situations
(finding fastest and finding cheapest routes), this can happen.

Let's take Jennifer's fastest route for example.  (btw, this example won't
make any sense if you don't understand the algorithms mentioned above and I'm not
going to explain them here).  Jennifer doesn't like being in airplanes or
airports.  It is possible that there is a route to city D that only takes 3
hours, but because of a late departure out of city A, she misses a departure out
of city D.  However, there could have been an earlier flight out of city A that
took longer time, but still arrived in city D in time to take a more
advantageous flight out of city D that makes up for the time lost by taking a
longer flight there.  More complications arise when trying to find the cheapest
route.
