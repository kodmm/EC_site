class EndUser < ApplicationRecord
  acts_as_paranoid 

  enum is_deleted: {"退会済": true, "有効": false}

 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders
  has_many :order_details, through: :orders, source: :order

  validates :name, presence: true, length:{minimum: 2, maximum: 20}
  validates :kana_surname, presence: true
  validates :kana_name, presence: true
  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true

end
