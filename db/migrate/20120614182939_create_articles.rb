class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :front_version_id

      t.string :meta_title_ru
      t.string :meta_description_ru
      t.string :meta_keywords_ru
      t.string :title_ru
      t.text :short_description_ru
      t.text :body_ru

      t.string :meta_title_en
      t.string :meta_description_en
      t.string :meta_keywords_en
      t.string :title_en
      t.text :short_description_en
      t.text :body_en
      
      t.timestamps
    end

    add_index :articles, [:front_version_id], :name => "articles_front_version_id_index"
  end
end
