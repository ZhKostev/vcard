class Admin::ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  layout 'admin'
end
