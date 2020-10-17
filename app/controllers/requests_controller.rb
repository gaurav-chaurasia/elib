class RequestsController < ApplicationController 
    before_action :authenticate_user! 
    
    # Requests: GET
    # show all request assosiated to a specific book/:book_id/requests
    def index 
        @requests = Request.where(book_id: params[:book_id])
    end    
    
    # Requests: POST
    # create request for any specific /requests/:book_id
    def create
        request = Request.createRequest(current_user.id, params[:book_id])
        respond_to do |format|
            if request != nil
                format.html { redirect_to root_path, notice: 'Request was successfully created.' }
            else
                format.html { redirect_to root_path, notice: 'Something went wrong request not created!' } 
            end
        end
    end


    private
        
    def request_params
        params.require(:request).permit(:book_id, :status)
    end
end