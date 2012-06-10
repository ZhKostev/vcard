#encoding: utf-8
class CommonMailer < ActionMailer::Base
  default from: "kostev.no.reply@gmail.com"

  def contact_email(body, name = nil, email = nil)
    @name = name
    @content = body
    @email = email
    mail(:to => 'zh.kostev@gmail.com', :subject => 'Сообщение с сайта.')
  end
end
