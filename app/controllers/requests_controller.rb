class RequestsController < ApplicationController 
    before_action :authenticate_user! 
    before_action :authenticate_admin, only: [:approve, :reject, :index]
    
    # Requests: GET
    # show all request assosiated to a specific book/:book_id/requests
    def index 
        @requests = Request.where(book_id: params[:book_id])
    end    
    
    # Requests: POST
    # create request for any specific book /requests/:book_id
    def create
        request = Request.validateAndCreateRequest(current_user.id, params[:book_id])
        respond_to do |format|
            if request
                format.html { redirect_to root_path, notice: 'Request was successfully created.' }
            else
                flash[:warning] = ["Something went wrong request not created!"]
                flash[:warning] << "You already have requested this book you request is in process"
                format.html { redirect_to root_path } 
            end
        end
    end

    # because of lake of time implimenting in easy and non conventional way
    def approve
        result = Request.approveRequest(params[:id])
        respond_to do |format|
            if result
                format.html { redirect_to '#', notice: 'Request was successfully Approved.' }
            else
                format.html { redirect_to '#', notice: 'Something went wrong request not Approved!' } 
            end
        end
    end

    def reject
        result = Request.rejectRequest(params[:id])
        respond_to do |format|
            if result
                format.html { redirect_to '#', notice: 'Request was successfully Rejected.' }
            else
                format.html { redirect_to '#', notice: 'Something went wrong request not Rejected!' } 
            end
        end
    end




    private
        
    def request_params
        params.require(:request).permit(:book_id, :user_id, :id, :status)
    end
end