class SubscribeNotificationMailer < ActionMailer::Base
  layout 'airmail'
  default from: "kostev.no.reply@gmail.com"  #TODO REPLACE TO NO-REPLY EMAIL

  def subscribe_congratulations(subscriber)
    @subscriber = subscriber
    @language = subscriber.language.to_s == 'ru' ? 'ru' : 'en'
    mail(:to => subscriber.email, :subject => t(:subscribe_congratulations))
  end
end
