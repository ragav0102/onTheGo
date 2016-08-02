# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  C_in       :time
#  C_out      :time
#  Guests     :integer
#  Amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ActiveRecord::Base
  attr_accessible :Amount, :C_in, :C_out, :Guests
end
