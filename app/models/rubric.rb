class Rubric < ActiveRecord::Base
  has_and_belongs_to_many :articles, :uniq =>true
  extend FriendlyId

  scope :with_published_articles, joins(:articles).where("articles.original_id IS NOT NULL")

  validates :title_en, :title_ru, :uniqueness => true, :presence => true
  paginates_per 5
end
