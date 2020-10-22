class Request < ApplicationRecord
    belongs_to :user
    belongs_to :book

    # enum status: [:pending, :approved, :rejected]
    ALL_STATUS = %w[pending approved rejected returned].freeze
    enum status: ALL_STATUS.zip(ALL_STATUS).to_h

    # validating one user can not create many request for same book 
    def self.validate_book_request(user_id, book_id)
        request = Request.where(user_id: user_id, book_id: book_id).first
        if request and (request.approved? || request.pending?)
            return false
        else
            return true
        end
    end

    def self.to_csv
        require 'csv'
        attributes = %w[user_id user_name book_id book_title status created_at updated_at]

        CSV.generate do |csv|
            csv << attributes
            all.each do |request|
                csv << [request.user_id, request.user.full_name, request.book_id, request.book.title, request.status, request.created_at, request.updated_at]
            end
        end
    end

    def self.validate_and_create_request(user_id, book_id)
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

    # only pending requests can be approved
    def self.approve_request(id)
        request = Request.find(id)
        
        if request.book.quantity > 0 && request
            if request.pending?
                request.update_status('approved')
                request.process_book('dec')
                if request.book.save && request.save 
                    return 'success'
                else
                    return nil
                end
            end
        end
        return nil
    end

    # only pendding books can be rejected not the approved or returned
    def self.reject_request(id)
        
        request = Request.find(id)
        
        if request.pending?
            request.update_status('rejected')
            if request.save
                return 'success'
            else
                return nil
            end
        end
    end

    # only already approved books can be return to lib
    def self.return_book(id)
        
        request = Request.find(id)

        if request.approved?
            request.update_status('returned')
            request.process_book('inc')
            if request.book.save && request.save 
                return 'success'
            end
        end
        return nil
    end

    # private

    def update_status(status)
        self.status = status
    end

    def process_book(operation)
        if operation == 'inc'
            self.book.quantity += 1
        elsif operation == 'dec'
            self.book.quantity -= 1
        else 
            nil
        end
    end
end
