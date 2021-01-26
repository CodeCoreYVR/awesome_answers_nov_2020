# Step 1 : Many to Many
# Generate the table

class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :questions, through: :tagging
end
