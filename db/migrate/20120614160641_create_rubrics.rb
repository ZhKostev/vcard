class CreateRubrics < ActiveRecord::Migration
  def change
    create_table :rubrics do |t|
      t.string :title_en
      t.string :title_ru

      t.timestamps
    end
  end
end
