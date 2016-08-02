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

class House < ActiveRecord::Base
  attr_accessible :Ch_in, :Ch_out, :Charge_day, :address, :max_guests
end
