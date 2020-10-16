class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
    redirect_to books_path, notice: "You don't have admin access!" unless current_user.admin
  end
end
