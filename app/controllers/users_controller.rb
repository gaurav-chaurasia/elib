class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action
    before_action :set_user, only: [:show, :dashboard, :admin]
    # Get a list of all users
    # Requests: GET
    def index
        @users = User.all
    end

    # Get user dashboard
    # Requests: GET
    def show
    end

    def dashboard
        @requests = Request.where(user: current_user)
    end

    def admin
        @requests = Request.all
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end
end