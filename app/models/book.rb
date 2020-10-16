class Book < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    
    validates :title, presence: true
    validates :isbn, presence: true

    def add_user(current_user)
        self.user = current_user
    end

end
