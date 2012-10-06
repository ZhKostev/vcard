class SubscribeNotificationMailer < ActionMailer::Base
  layout 'airmail'
  default from: "kostev.no.reply@gmail.com"  #TODO REPLACE TO NO-REPLY EMAIL

  def subscribe_congratulations(subscriber)
    @subscriber = subscriber
    I18n.locale = subscriber.language.to_s == 'ru' ? :ru : :en
    mail(:to => subscriber.email, :subject => t(:subscribe_congratulations))
  end

  def article_save_or_update_notice(subscriber, link)
    @subscriber = subscriber
    @url = link
    I18n.locale = subscriber.language.to_s == 'ru' ? :ru : :en
    mail(:to => subscriber.email, :subject => t(:zh_kostev_blog_update))
  end
end
