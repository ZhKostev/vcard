class Rubric < ActiveRecord::Base
  has_and_belongs_to_many :articles, :uniq =>true
  extend FriendlyId

  validates :title_en, :title_ru, :uniqueness => true, :presence => true
  paginates_per 5
end
