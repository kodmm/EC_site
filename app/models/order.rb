class Order < ApplicationRecord
    enum payment: {"クレジットカード": 0, "銀行振込": 1}
    belongs_to :end_user

    validates :end_user_id, presence: true
    validates :payment, presence: true
    validates :strret_address, presence: true
end
