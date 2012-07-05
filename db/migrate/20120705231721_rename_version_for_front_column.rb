class RenameVersionForFrontColumn < ActiveRecord::Migration
  def change
    rename_column :articles, :front_version_id, :original_id
  end
end
