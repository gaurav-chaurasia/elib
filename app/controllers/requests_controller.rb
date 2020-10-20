class RequestsController < ApplicationController 
    before_action :authenticate_user! 
    before_action :authenticate_admin, only: [:approve, :reject, :index, :csvrequests]
    
    # Requests: GET
    # show all request assosiated to a specific book/:book_id/requests
    def index 
        @requests = Request.where(book_id: params[:book_id])
    end    
    
    # Request: GET
    # download all requests as csv
    def csvrequests
        @requests = Request.all.order(created_at: :asc)
        respond_to do |format|
            format.html
            format.csv { send_data @requests.to_csv }
        end
    end
    
    # Requests: POST
    # create request for any specific book /requests/:book_id
    def create
        request = Request.validateAndCreateRequest(current_user.id, params[:book_id])
        respond_to do |format|
            if request
                format.html { redirect_to root_path, notice: 'Request was successfully created.' }
            else
                flash[:warning] = [
                    "Something went wrong request not created!",
                    "You already have requested this book you request is in process"
                ]
                format.html { redirect_to root_path } 
            end
        end
    end

    # approve, reject and return => REQUEST: PUT
    # because of lake of time implimenting in easy and non conventional way
    def approve
        result = Request.approveRequest(params[:id])
        if result
            flash[:info] = "Request was successfully Approved."
        else
            flash[:warning] = [
                'Something went wrong request not Approved!',
                'book might be out of stock or rejected'
            ]
        end
        redirect_to admin_dashboard_path(current_user)
    end

    def reject
        result = Request.rejectRequest(params[:id])        
        if result
            flash[:info] = "Request was successfully Rejected."
        else
            flash[:danger] = 'Something went wrong request not Rejected!'  
        end
        redirect_to admin_dashboard_path(current_user)
    end

    def return
        result = Request.returnBook(params[:id])
        if result
            flash[:success] = "Book is returned successfully!"
        else
            flash[:danger] = 'Something went wrong book not returned!'  
        end
        redirect_to dashboard_path(current_user)
    end



    private
        
    def request_params
        params.require(:request).permit(:book_id, :user_id, :id, :status)
    end
end