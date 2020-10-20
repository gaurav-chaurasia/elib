class User::RegistrationsController < Devise::RegistrationsController
   
    private
  
    def sign_up_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :contact_number,
                                   :address,
                                   :admission_date,
                                   :email,
                                   :image,
                                   :password,
                                   :password_confirmation)
    end
  
    def account_update_paramss
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :contact_number,
                                   :address,
                                   :admission_date,
                                   :email,
                                   :image,
                                   :password,
                                   :password_confirmation,
                                   :current_password)
    end
end