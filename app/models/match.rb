# == Schema Information
#
# Table name: matches
#
#  id             :integer          not null, primary key
#  team_id        :integer
#  date           :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  result         :string(255)
#  position       :integer
#  rival_position :integer
#

class Match < ActiveRecord::Base
  attr_accessible :date, :result, :position, :rival_position

  belongs_to :team
end
