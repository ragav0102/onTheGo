class House < ActiveRecord::Base
  attr_accessible :Ch_in, :Ch_out, :Charge_day, :address, :max_guests
end
