class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  after_filter :save_return_url


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def save_return_url
    session[:return_path] = request.path unless action_name == 'change_language'
  end
end
