class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # authenticate user and print appropriate messages
  def authenticate_admin
    unless current_user.admin
      flash[:warning] = "permission denied!, you don't have admin access!"
      redirect_to books_path 
    end 
  end

end
