class Match < ActiveRecord::Base
  attr_accessible :match_date, :result

  belongs_to :team
end
