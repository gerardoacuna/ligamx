class TeamMatches < ActiveRecord::Base
  belongs_to :match
  belongs_to :team
end
