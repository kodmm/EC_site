class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length:{minimum: 2, maximum: 20}
  validates :kana_surname, presence: true
  validates :kana_name, presence: true
  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true

end
