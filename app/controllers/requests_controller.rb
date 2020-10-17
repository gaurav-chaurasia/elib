class RequestsController < ApplicationController 
    before_action :authenticate_user!
    
    # Requests: GET
    #show all request assosiated to a specific book/:book_id/requests
    def index 
        @requests = Request.where(books_id: params[:book_id])
    end    
    

    def create
        request = Book.createRequest(params[:book_id])
        respond_to do |format|
            if request
                format.html { redirect_to root_path, notice: 'Request was successfully created.' }
            else
                format.html { redirect_to root_path, notice: 'Something went wrong request not created!' } 
            end
        end
    end


    private
        
    def request_params
        params.require(:request).permit(:book_id, :id)
    end
end