class Order < ApplicationRecord
    enum payment: {"クレジットカード": 0, "銀行振込": 1}
    enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
    belongs_to :end_user
    has_many :order_details

    validates :end_user_id, presence: true
    validates :payment, presence: true
    
   
end
