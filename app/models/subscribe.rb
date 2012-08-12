class Subscribe < ActiveRecord::Base
  attr_accessible :email
  validates :email, :presence => true,
            :format => {:with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i},
            :uniqueness => true
end
