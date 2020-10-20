class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin, except: [:show, :dashboard] 
    before_action :set_user, only: [:show, :dashboard, :admin]
    
    # Get a list of all users
    # Requests: GET
    def index
        @users = User.all
    end

    # Get user details
    # Requests: GET
    def show
    end

    # Get user dashboard
    # Requests: GET
    def dashboard
        @requests = Request.where(user: current_user).order(updaed_at: :asc)
    end

    # Get admin user dashboard
    # Requests: GET
    # any admin can change books detail or approve/reject request
    def admin
        @requests = Request.all.order(updaed_at: :asc)
        @books = Book.all
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end
end