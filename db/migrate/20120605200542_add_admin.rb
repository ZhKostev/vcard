class AddAdmin < ActiveRecord::Migration
  def up
    User.create(:email => 'admin@admin.com',
                :password => 'admin@admin.com',
                :password_confirmation => 'admin@admin.com'
    )
  end

  def down
    User.destroy_all
  end
end
