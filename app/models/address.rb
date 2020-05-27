class Address < ApplicationRecord
    belongs_to :end_user


    def full_address
        [postal_code, street_address, address].join(' ')
    end
end
