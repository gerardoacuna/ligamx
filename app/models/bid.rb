class Bid < ActiveRecord::Base
  attr_accessible :accepted, :price, :team_id, :user_id

  validates_presence_of :price, :team_id, :user_id

  belongs_to :user
  belongs_to :team

  default_scope where("accepted = false").order("price DESC, created_at ASC")
end
