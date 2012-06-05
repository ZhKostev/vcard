class HomeController < ApplicationController
  layout "full_site", :only => [:index]

  def index
  end

  def about
    redirect_to "#{root_url}#{I18n.locale}#!/about" unless request.xhr?
  end
end
