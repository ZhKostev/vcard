class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validate :only_one_admin

  def only_one_admin
    self.errors.add(:base, "admin already exist") if User.count > 1
  end
end
