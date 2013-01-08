# == Schema Information
#
# Table name: transactions
#
#  id            :integer          not null, primary key
#  initial_value :decimal(8, 2)
#  final_value   :decimal(8, 2)
#  roi           :decimal(8, 2)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stock_id      :integer
#  user_id       :integer
#

class Transaction < ActiveRecord::Base
  attr_accessible :stock_id, :final_value, :initial_value, :roi

  belongs_to :user
  belongs_to :stock
end
