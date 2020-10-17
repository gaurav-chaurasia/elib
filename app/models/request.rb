class Request < ApplicationRecord
    belongs_to :user
    belongs_to :book

    enum status: [:pending, :approved, :rejected]

    def self.createRequest(user_id, book_id)
        book = Book.find(book_id)
        if book && book.quantity > 0
            book.quantity -= 1
            request = Request.new(user_id: user_id, book_id: book_id)
            if book.save and request.save
                request
            end
        end
        return nil
    end

end
