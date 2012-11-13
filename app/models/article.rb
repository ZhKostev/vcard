#encoding: utf-8

#| front_version_id        | int(11)      | YES  | MUL | NULL    |                |
#| meta_title_ru           | varchar(255) | YES  |     | NULL    |                |
#| meta_description_ru     | varchar(255) | YES  |     | NULL    |                |
#| meta_keywords_ru        | varchar(255) | YES  |     | NULL    |                |
#| title_ru                | varchar(255) | YES  |     | NULL    |                |
#| short_description_ru    | text         | YES  |     | NULL    |                |
#| body_ru                 | text         | YES  |     | NULL    |                |
#| meta_title_en           | varchar(255) | YES  |     | NULL    |                |
#| meta_description_en     | varchar(255) | YES  |     | NULL    |                |
#| meta_keywords_en        | varchar(255) | YES  |     | NULL    |                |
#| title_en                | varchar(255) | YES  |     | NULL    |                |
#| short_description_en    | text         | YES  |     | NULL    |                |
#| body_en                 | text         | YES  |     | NULL    |                |
#| slug                    | varchar(255) | YES  | MUL | NULL    |                |
#| has_russian_translation | tinyint(1)   | NO   |     | NULL    |                |
#| has_english_translation | tinyint(1)   | NO   |     | NULL    |                |
#+-------------------------+--------------+------+-----+---------+----------------+
class Article < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper
  include Modules::ModelTranslation
  include Rails.application.routes.url_helpers
  extend FriendlyId

  belongs_to :original, :class_name => "Article", :foreign_key => :original_id
  has_and_belongs_to_many :rubrics, :uniq => true
  has_and_belongs_to_many(:articles,
                          :join_table => "articles_connections",
                          :foreign_key => "article_a_id",
                          :association_foreign_key => "article_b_id")
  friendly_id :title_en, use: :slugged

  scope :originals, where(:original_id => nil)
  scope :front_versions, where("original_id IS NOT NULL")

  validates :title_ru, :presence => true

  default_value_for :has_russian_translation, true
  default_value_for :has_english_translation, false

  #return articles witch has translation for current locale
  def self.for_current_locale
    if I18n.locale == :en
      where(:has_english_translation => true)
    else
      where(:has_russian_translation => true)
    end
  end

  def assign_attributes(attributes, options = {})
    if (rubrics = attributes.delete(:rubrics))
      self.rubrics.destroy_all
      rubrics.each do |r_id|
        self.rubrics << Rubric.find_by_id(r_id)
      end
    end
    if (articles = attributes.delete(:articles))
      self.articles.destroy_all
      articles.select{|a| a.present?}.each do |article_id|
        self.articles << Article.find_by_id(article_id)
      end
    end
    super(attributes, options = {})
  end

  #create version for front  and send notification
  def publish!
    if (clone = Article.find_by_original_id(self.id))
      clone.update_attributes!(self.attributes)
    else
      clone = Article.create!(self.attributes)
    end
    clone.update_column(:original_id, self.id)
    clone.rubrics.destroy_all
    clone.rubrics << self.rubrics
   # send_notifications
  end


  def related_articles
    Article.for_current_locale.where("id IN (?)", (self.original || self).articles.map{|a| a.front_version.try(:id)}.compact)
  end

  def front_version
    Article.for_current_locale.find_by_original_id(self.id)
  end

  #return current article's status
  def status
    Article.find_by_original_id(self.id).present? ? 'Published' : 'Draft'
  end

  def short_summary_ru
    truncate(short_description_ru.present? ? short_description_ru : strip_tags(body_ru), :length => 400)
  end

  def short_summary_en
    truncate(short_description_en.present? ? short_description_en : strip_tags(body_en), :length => 400)
  end

  private
  def send_notifications
    language_array = []
    language_array << 'en' if self.has_english_translation?
    language_array << 'ru' if self.has_russian_translation?
    subscribers = Subscribe.for_language(language_array).all
    send_email_notifications(subscribers)
  end

  def send_email_notifications(subscribers, options = {})
    subscribers.each do |subscriber|
      SubscribeNotificationMailer.article_save_or_update_notice(subscriber, show_article_url(self)).deliver
    end
  end
  #handle_asynchronously :send_email_notifications
end
