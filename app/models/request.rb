class Request < ApplicationRecord
    belongs_to :user
    belongs_to :book

    # enum status: [:pending, :approved, :rejected]

    def self.createRequest(user_id, book_id)
        book = Book.find(book_id)
        if book && book.quantity > 0
            book.quantity -= 1
            request = Request.new(user_id: user_id, book_id: book_id)
            if book.save and request.save
                return request
            end
        end
        return nil
    end

    def self.approveRequest(id)
        request = Request.find(id)
        request.status = 'approved'
        if request.save
            return 'success'
        else
            nil
        end
    end

    def self.rejectRequest(id)
        request = Request.find(id)
        request.status = 'rejected'
        if request.save
            return 'success'
        else
            nil
        end
    end
end
