class Request < ApplicationRecord
    belongs_to :user
    belongs_to :book

    # enum status: [:pending, :approved, :rejected]
    ALL_STATES = %w[pending approved rejected returned].freeze
    enum status: ALL_STATES.zip(ALL_STATES).to_h

    # validating one user can not create many request for same book 
    def self.validateBookRequest(user_id, book_id)
        request = Request.where(user_id: user_id, book_id: book_id).first
        if request and (request.approved? || request.pending?)
            return false
        else
            return true
        end
    end

    def self.validateAndCreateRequest(user_id, book_id)
        
        request = Request.where(user_id: user_id, book_id: book_id).first
        if request and (request.approved? || request.pending?)
            return nil
        end

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
