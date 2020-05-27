class Genre < ApplicationRecord
    enum status: {"有効": 0, "無効": 1}

    has_many :items
    validates :name, presence: true
    validates :status, presence: true

 
end
