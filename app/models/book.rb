class Book < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    
    validates :title, presence: true
    validates :isbn, presence: true
    validates_uniqueness_of :isbn

    scope :getValidBooks, -> { where('quantity > ?', 0) }
        
    def add_user(current_user)
        self.user = current_user
    end

    # this could have more logic
    def self.getPopularBooks
        Book.order(created_at: :desc).limit(10)
    end
end
