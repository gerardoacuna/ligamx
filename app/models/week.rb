# == Schema Information
#
# Table name: weeks
#
#  id          :integer          not null, primary key
#  number      :integer
#  schedule_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Week < ActiveRecord::Base
  attr_accessible :number, :schedule_id, :matchups_attributes

  belongs_to :schedule
  has_many	 :matchups

  accepts_nested_attributes_for :matchups

  def matchups_by_day
    matchups.find(:all).group_by { |match| match.date.strftime("%B #{match.date.day}") }
  end
end
