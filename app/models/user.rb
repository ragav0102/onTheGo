# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone           :string(255)
#  balance         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :balance, :email, :name, :phone, :password, :password_confirmation
  has_secure_password

  has_many :houses, dependent: :destroy
  has_many :bookings, dependent: :destroy


  before_save { email.downcase! }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :phone, presence: true, uniqueness: true, numericality: true, length:  { :minimum => 10, :maximum => 12 }
  #validates :balance, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  after_validation { self.errors.messages.delete(:password_digest) }
=begin
  def book!(house)

    if house.user.id != current_user
      bookings.create!(house_id: house.id)
      house.availability = false
      redirect_to house
    else
      render house
    end

    house
  end


  def unbook!(house)
    if @user == current_user && house.availability == false
      Booking.find_by_house_id(house.id).destroy
      house.availability = true
      redirect_to house
    end
  end
  
=end
  def booked?(house)
    current_user.bookings.find_by_house_id(house.id)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
