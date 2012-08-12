class Rubric < ActiveRecord::Base
  extend FriendlyId
  include Modules::ModelTranslation
  friendly_id :title_en, use: :slugged

  has_and_belongs_to_many :articles, :uniq =>true
  validates :title_en, :title_ru, :uniqueness => true, :presence => true

  scope :with_published_articles, joins(:articles).where("articles.original_id IS NOT NULL")

  paginates_per 5
end
