# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announcement < ActiveRecord::Base
  attr_accessible :content, :title
end
