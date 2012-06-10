#encoding: utf-8
class ContactController < ApplicationController
  def send_email
    prepare_contact_params
    if params[:message]
      CommonMailer.contact_email(params[:message], params[:name], params[:email]).deliver!
      @success = true
    else
      @errors = [:contact_message_err]
      validate_email_param if params[:email]
    end
  end


  private

  def prepare_contact_params
    params[:message] = nil if %w(Message* Сообщение*).include?(params[:message])
    params[:email] = nil if ['Your E-mail Address', 'Адрес электронной почты'].include?(params[:email])
    params[:name] = nil if ['Your Name', 'Ваше имя'].include?(params[:name])
  end

  def validate_email_param
    email_regex = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

    @errors += [:contact_email_err] unless params[:email]=~ email_regex
  end
end
