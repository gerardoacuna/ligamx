# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ActiveRecord::Base
  attr_accessible :name, :weeks_attributes

  has_many :weeks

  accepts_nested_attributes_for :weeks
end
