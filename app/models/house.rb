# == Schema Information
#
# Table name: houses
#
#  id           :integer          not null, primary key
#  address      :string(255)
#  max_guests   :integer
#  Charge_day   :integer
#  Ch_in        :time
#  Ch_out       :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  name         :string(255)
#  availability :boolean
#  pic          :string(255)
#  place        :string(255)
#

class House < ActiveRecord::Base
  PLACES = ["Chennai", "Coimbatore", "Bengaluru"].freeze
  attr_accessible :Ch_in, :Ch_out, :Charge_day, :address, :max_guests, :name, :availability, :pic, :PLACES, :place
  mount_uploader :pic, PicUploader
  belongs_to :user
  has_one :booking, foreign_key: "house_id", dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :user_id, presence: true
  validates :address, presence: true, length: { maximum: 100 }
  validates :max_guests, presence: true, length: { maximum: 10, minimum: 1 }
  validates :Charge_day, presence: true
  validates :place, presence: true
  validates :pic, presence: true
  validates :availability, presence: true

  default_scope order: 'houses.max_guests ASC'

  def self.search(search)
    where("name LIKE ? OR address LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end



end
