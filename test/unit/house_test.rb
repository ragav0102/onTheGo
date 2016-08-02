# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  max_guests :integer
#  Charge_day :integer
#  Ch_in      :time
#  Ch_out     :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
