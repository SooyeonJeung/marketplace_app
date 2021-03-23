class Product < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    has_one :payment

    self.inheritance_column = "not_sti"

    def self.search(search)
        if search 
            where(["name ILIKE ?","%#{search}%"])
        else
            all
        end
    end 

end
