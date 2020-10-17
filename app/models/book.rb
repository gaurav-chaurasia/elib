class Book < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    
    validates :title, presence: true
    validates :isbn, presence: true
    validates_uniqueness_of :isbn

    def add_user(current_user)
        self.user = current_user
    end

    def self.getValidBooks
        Book.where('quantity > ?', 0)
    end

    def self.getPopularBooks
        Book.order(updated_at: :desc).limit(10)
    end
end
