class User < ActiveRecord::Base
  attr_accessible :balance, :email, :name, :phone
end
