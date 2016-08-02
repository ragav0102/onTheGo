# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  balance    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :balance, :email, :name, :phone, :password, :password_confirmation
  has_secure_password


  before_save { email.downcase! }


  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :phone, presence: true, uniqueness: true, numericality: true, length:  { :minimum => 10, :maximum => 12 }
  #validates :balance, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


end
