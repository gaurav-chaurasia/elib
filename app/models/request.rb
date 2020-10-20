class Request < ApplicationRecord
    belongs_to :user
    belongs_to :book

    # enum status: [:pending, :approved, :rejected]
    ALL_STATUS = %w[pending approved rejected returned].freeze
    enum status: ALL_STATUS.zip(ALL_STATUS).to_h

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
        request = Request.where(user_id: user_id, book_id: book_id).order(created_at: :desc).first
        if request and (request.approved? || request.pending?)
            return nil
        else
            request = Request.new(user_id: user_id, book_id: book_id)
            if request.save
                return request
            end
        end
    end

    def self.approveRequest(id)
        request = Request.find(id)
        book = Book.find(request.book.id)
        
        if book && (book.quantity > 0) && request
            if request.pending?
                request.status = 'approved'
                book.quantity -= 1
                if book.save && request.save 
                    return 'success'
                else
                    return nil
                end
            end
        end
        return nil
    end

    def self.rejectRequest(id)
        
        request = Request.find(id)
        
        if request.pending?
            request.status = 'rejected'
            if request.save
                return 'success'
            else
                return nil
            end
        end
    end

    def self.returnBook(id)
        
        request = Request.find(id)
        book = Book.find(request.book.id)

        if request.approved?
            request.status = 'returned'
            book.quantity += 1
            if book.save && request.save 
                return 'success'
            end
        end
        return nil
    end
    
end
