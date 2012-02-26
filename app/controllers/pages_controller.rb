class PagesController < ApplicationController
  def index
    @title = 'Welcome to the Fry Farms Co-op'
  end

  def show
    # No caching on private pages

    pages = {
      'about'      => 'About Us',
      'join'       => 'Join'
    }
    private_pages = {
      'dashboard'  => 'Dashboard',
      'faq' => 'Frequently Asked Questions'
    }


    if !(pages.merge private_pages).keys.include?(params[:id]) || (
        # Don't allow non-logged in users to see private pages
        !current_user && private_pages.keys.include?(params[:id])
      )
      render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
    else
      @permalink = params[:id]
      @title     = pages[params[:id]] || private_pages[params[:id]]
    end
  end
end
