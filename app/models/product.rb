class Product < ApplicationRecord
    has_one :user
    has_one_attached :picture
end
