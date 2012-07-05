class AddFriendlyIdToRubric < ActiveRecord::Migration
  def change
    add_column :rubrics, :slug, :string
    add_index :rubrics, :slug
  end
end
