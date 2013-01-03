class Match < ActiveRecord::Base
  attr_accessible :date, :result, :position, :rival_position

  belongs_to :team
end
