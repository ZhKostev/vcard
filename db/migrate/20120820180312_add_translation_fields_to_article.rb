class AddTranslationFieldsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :has_russian_translation, :boolean, :null => false
    add_column :articles, :has_english_translation, :boolean, :null => false
  end
end
