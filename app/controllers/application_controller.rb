class ApplicationController < ActionController::Base
  NOT_REMEMBER_ACTIONS = %w(change_language send_email)
  protect_from_forgery
  before_filter :set_locale
  after_filter :save_return_url


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def save_return_url
    session[:return_path] = request.path unless NOT_REMEMBER_ACTIONS.include?(action_name)
  end
end
