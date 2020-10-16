class Book < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true
    validates :isbn, presence: true

    def add_user(current_user)
        self.user = current_user
    end

end
