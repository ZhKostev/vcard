class BlogController < ApplicationController
  layout 'blog'

  def show_rubric
    @rubric = Rubric.find(params[:id])
  end

  def show_article
    @article = Article.front_versions.find(params[:id]) rescue (redirect_to blog_url, :status => 404)
  end

  def subscribe
    @subscriber = Subscribe.new(params[:subscriber])
    if (@success = @subscriber.save)
      SubscribeNotificationMailer.subscribe_congratulations(@subscriber).deliver
    end
  end

  def unsubscribe
    system_message = if (subscriber = Subscribe.find_by_id(params[:id]))
                       I18n.locale = subscriber.language == 'ru' ? :ru : :en
                       subscriber.destroy
                       t(:success_unsubscribe)
                     else
                       t(:fail_unsubscribe)
                     end
    redirect_to root_path(:locale => I18n.locale, :system_message => system_message)
  end

  def routing_error
    I18n.locale = :en if request.path.split('/')[1] == 'en'
    render "404", :status => 404
  end
end
