class MembersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :members_only

  private

    def members_only
      if !current_user.is_member?
        flash[:error] = "I'm sorry. You must be a member to access that page."
        redirect_to root_path
      end
    end

end
