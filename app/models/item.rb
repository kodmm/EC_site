class Item < ApplicationRecord
    enum status: {"販売中": 0, "品切れ": 1}
    attachment :image
    has_many :cart_items, dependent: :destroy
    belongs_to :genre

    validates :genre_id, presence: true
    validates :name, presence: true
    validates :price, presence: true
    validates :status, presence: true
    validates :details, presence: true

    def self.search(search)
        return Item.all unless search
        Item.where(['name LIKE ?', "%#{search}%"])
    end
end
