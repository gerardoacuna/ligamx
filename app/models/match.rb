class Match < ActiveRecord::Base
  attr_accessible :match_date, :result, :position

  belongs_to :team
end
