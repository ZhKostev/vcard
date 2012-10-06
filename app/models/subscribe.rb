class Subscribe < ActiveRecord::Base
  attr_accessible :email, :language
  validates :email, :presence => true,
            :format => {:with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i},
            :uniqueness => true

  scope :for_language, lambda{|l_a| where("language IN (?) OR language = 'all'", l_a)}
end
