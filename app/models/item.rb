class Item < ApplicationRecord
    has_many :items, dependent: :destroy
end
