Robots vs. Lasers
=================

Given the location of lasers and the robot along a conveyor belt, determine the
direction that will yield the least damage to the robot.

Usage
-----

    ruby -I"lib" bin/incinerate_robot.rb [input.txt]
    ruby -I"lib" bin/incinerate_robot.rb [input.txt] > output.txt

Explanation
-----------

This puzzle was considerably less taxing on my brain than the tourists problem.

Basically, I parse the conveyor into an array of `north_lasers`, `south_lasers`,
and `robot_location`.  Once it is all parsed, I have an array of `Conveyor`s.

For each conveyor, I split the arrays so that I have 2 arrays of lasers going
west (north and south) and 2 going east. Then, I reverse the arrays going west
so that I can assume that all arrays now start with the robot at the 0 location
and go through the entire array.

Once I have all the little arrays, I just go through the arrays, checking for
the existence of lasers on the correct click (odd or even) and add up the
damage.
