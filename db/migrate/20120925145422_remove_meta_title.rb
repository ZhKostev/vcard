class RemoveMetaTitle < ActiveRecord::Migration
  def up
    remove_column :articles, :meta_title_en
    remove_column :articles, :meta_title_ru
    remove_column :articles, :meta_keywords_en
    remove_column :articles, :meta_keywords_ru
  end

  def down
    add_column :articles, :meta_title_en, :string
    add_column :articles, :meta_title_ru, :string
    add_column :articles, :meta_keywords_en, :string
    add_column :articles, :meta_keywords_ru, :string
  end
end
