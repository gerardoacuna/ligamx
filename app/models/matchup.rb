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

	validate :team_cannot_play_self
  validate :matchup_does_not_exist_reversed

  validates_uniqueness_of :team1_id, { scope: :week, message: "already has a matchup that week" }
  validates_uniqueness_of :team2_id, { scope: :week, message: "already has a matchup that week" }

  validate :week_does_not_exist_team1_reversed
  validate :week_does_not_exist_team2_reversed

  def self.all_team_matchups(team)
    where("team1_id = :team_id OR team2_id = :team_id", {team_id: team})
  end

  private

	  def team_cannot_play_self
	     if team1_id == team2_id then
	       errors.add(:team1_id, "cannot play self")
	     end
	  end

	  def matchup_does_not_exist_reversed
	    if Matchup.find_by_team1_id_and_team2_id(team2_id, team1_id) then
	      errors.add(:team1_id, "already has a matchup with Team2")
	    end
	  end

	  def week_does_not_exist_team1_reversed
	    if Matchup.find_by_team1_id_and_week_id(team2_id, week_id) then
	      errors.add(:team2_id, "already has a matchup that week")
	    end
	  end

	  def week_does_not_exist_team2_reversed
	    if Matchup.find_by_team2_id_and_week_id(team1_id, week_id) then
	      errors.add(:team1_id, "already has a matchup that week")
	    end
	  end

end
