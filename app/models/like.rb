# rails g model like --skip
# --skip flag will help you not to generate a migration for creating a table which is already there(basically it will skip all the files which already exsist)
class Like < ApplicationRecord
    belongs_to :user
    belongs_to :question
end
