# Draft Tracker
#
# Description:
#
#   Chase Bank was recently contacted by the NFL to provide an
#   NFL Draft Tracker to manage the assignment of players
#   during the 2010 draft.
#
#   The NFL has provided the following files to use for the system:
#     Draftable Players: player.csv
#     NFL Teams:         teams.csv
#     Draft Order:       order.csv
#
# --------------------------------------------------------------------------------
#
# The basic functionality that needs developed:
#
#    In order to record the results of the Draft in real-time
#    As a System Administrator (don't implement authorization)
#    I want to assign a player to a team during the draft period
#    (which is defined by the draft order)
#
#    In order to get a real time update
#    As a User
#    I want to see the results of the draft by round and by NFL Team
#
#    In order to see which players are still draftable
#    As a User
#    I want to be able to view all remaining players alphabetically by position
#
#    In order to see only what is actively happening
#    As a User
#    I want to see the latest 3 picks and which team is next to pick
#
# --------------------------------------------------------------------------------
#
# Deliverables:
#
#   - A working Rails application that handles the functionality listed above
#     (views, models, controllers, etc.)
#   - A rake task that loads the raw spreadsheet data
#   - A rake task that simulates the draft process (i.e., the rake task would 
#     simulate a user performing the whole draft process)
#
# --------------------------------------------------------------------------------
#
# Tips:
#   - There aren't any hidden tricks with this problem.  We're not trying to trip you
#     up or anything.  Just do your best!
#   - Don't spend too much time on the user interface.  We like pretty interfaces as 
#     much as the next guy, but for this we'll be looking more at your models and your
#     overall implementation.
#   - Here's a start to the models you might need:

class Team < ActiveRecord::Base
  def acquire(player)
  end
end

class Player < ActiveRecord::Base
end

class Ownerships < ActiveRecord::Base
end
