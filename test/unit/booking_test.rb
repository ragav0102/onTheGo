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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
