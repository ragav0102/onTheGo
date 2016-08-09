# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  house_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ActiveRecord::Base
  attr_accessible :house_id, :user_id 

  belongs_to :user
  belongs_to :house

  validates :user_id, presence: true
  validates :house_id, presence: true


end
