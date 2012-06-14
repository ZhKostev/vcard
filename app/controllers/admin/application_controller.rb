class Admin::ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :set_en_locale
  layout 'admin'

  def set_en_locale
    I18n.locale = :en
  end
end
