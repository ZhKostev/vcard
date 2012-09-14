class AddLanguageFieldToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :language, :string
  end
end
