class HomeController < ApplicationController
  layout "full_site", :only => [:index]

  def index
  end

  def about
    redirect_to "#{root_url}#{I18n.locale}#!/about" unless request.xhr?
  end

  def resume
    redirect_to "#{root_url}#{I18n.locale}#!/resume" unless request.xhr?
  end

  def contact
    redirect_to "#{root_url}#{I18n.locale}#!/contact" unless request.xhr?
  end

  def blog
    if request.xhr?
      @rubrics = Rubric.with_published_articles
    else
      redirect_to "#{root_url}#{I18n.locale}#!/blog"
    end
  end

  def change_language
    if params[:change_language]
      I18n.locale = params[:change_language]
      redirect_to  "/#{I18n.locale}/#{session[:return_path].gsub(/(\/ru|\/en)/,'')}"
    end
  end

end
