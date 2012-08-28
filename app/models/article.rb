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
  extend FriendlyId

  belongs_to :original, :class_name => "Article", :foreign_key => :original_id
  has_and_belongs_to_many :rubrics, :uniq => true
  friendly_id :title_en, use: :slugged

  scope :originals, where(:original_id => nil)
  scope :front_versions, where("original_id IS NOT NULL")

  validates :title_ru, :title_en, :presence => true

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
    super(attributes, options = {})
  end

  #create version for front
  def publish!
    if (clone = self.front_version)
      clone.update_attributes!(self.attributes)
    else
      clone = Article.create!(self.attributes)
    end
    clone.update_column(:original_id, self.id)
    clone.rubrics.destroy_all
    clone.rubrics << self.rubrics
  end


  def front_version
    Article.find_by_original_id(self.id)
  end

  #return current article's status
  def status
    self.front_version ? 'Published' : 'Draft'
  end

  def short_summary_ru
    truncate(short_description_ru.present? ? short_description_ru : strip_tags(body_ru), :length => 400)
  end

  def short_summary_en
    truncate(short_description_en.present? ? short_description_en : strip_tags(body_en), :length => 400)
  end
end
