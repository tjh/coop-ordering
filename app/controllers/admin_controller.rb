class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admins_only
end
