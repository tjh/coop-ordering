class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout

  helper_method :is_admin?,
                :is_member?

  private

    def is_admin?
      current_user && current_user.is_admin?
    end

    def is_member?
      current_user && current_user.is_member?
    end

    def admins_only
      if !current_user || !current_user.is_admin?
        flash[:error] = "I'm sorry. You do not have access to that page."
        redirect_to root_path
      end
    end

end
