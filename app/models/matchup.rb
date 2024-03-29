# == Schema Information
#
# Table name: matchups
#
#  id         :integer          not null, primary key
#  team1_id   :integer
#  team2_id   :integer
#  week_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :datetime
#

class Matchup < ActiveRecord::Base
  attr_accessible :date, :team2_id, :team1_id, :week_id

  belongs_to :week
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"

  validates :team1_id, presence: true
  validates :team2_id, presence: true
  validates :week_id, presence: true

  def self.all_team_matchups(team)
    where("team1_id = :team_id OR team2_id = :team_id", { team_id: team })
  end
end
