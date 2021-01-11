class Question < ApplicationRecord
    after_initialize :set_defaults
    before_save :capitalize_title
    # validates :title, presence: true
    # Create validations by using the 'validates' method
    # Th arguments are (in order):
    # - A column name as a symbol 
    # - Named arguments, corresponding to the validation rules

    # To read more on validations, go to:
    # https://guides.rubyonrails.org/active_record_validations.html
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    # validates :title, uniqueness: true
    validates :body , length:{minimum: 2, maximum: 10}
    validates :title, uniqueness: {scope: :body }
    validates :view_count, numericality: {greater_than_or_equal_to: 0}
    
    # .new
    # def self.recent_ten
    #     order("created_at DESC").limit(10)
    # end
    # Converting above method into a lambda
    scope :recent_ten,lambda{order("created_at DESC").limit(10)}

    private
    def capitalize_title
        self.title.capitalize!
    end
    def set_defaults
        self.view_count ||= 0
    end
    def no_monkey
        if body&.downcase&.include?("monkey")
            # &. is the safe navigation operator. It's used
        # like the . operator to call methods on an object.
        # If the method doesn't exist for the object, 'nil'
        # will be returned instead of getting an error
            self.errors.add(:body, "must not have monkeys")
            # To make a record invalid. You must add a 
            # validation error using the 'errors' 'add' method
            # It's arguments (in order):
            # - A symbol for the invalid column
            # - An error message as a string
        end
    
    end
        # LifeCycle of a Model is: Initialize > Validates> Save> Commits 
end

