class CreateRecipeTable < ActiveRecord::Migration
  def change
    create_table :receipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :cook_time
    end
  end
end 