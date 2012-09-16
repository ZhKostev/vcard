class CreateArticlesToArticlesTable < ActiveRecord::Migration
  def up
    create_table :articles_connections do |t|
      t.integer "article_a_id", :null => false
      t.integer "article_b_id", :null => false
    end

    add_index :articles_connections, [:article_a_id], :name => "article_a_id_index"
    add_index :articles_connections, [:article_b_id], :name => "article_b_id_index"
  end

  def down
    drop_table :articles_connections
  end
end
