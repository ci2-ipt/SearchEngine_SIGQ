class Category < ApplicationRecord
    validates :categoryName, presence: true
end
