class Rubric < ActiveRecord::Base
  validates :title_en, :title_ru, :uniqueness => true, :presence => true
  paginates_per 5
end
