class UsersController < ApplicationController
    before_action :authenticate_user!
    # Get a list of all users
    # Requests: GET
    def index
        @users = User.all
    end

    # Get user dashboard
    # Requests: GET
    def show
        @user = User.find(params[:id])
    end

    def dashboard
        
    end

    def admin_dashboard

    end
end