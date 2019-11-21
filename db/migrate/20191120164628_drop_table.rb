class DropTable < ActiveRecord::Migration
  def self.up
    rename_table :receipes, :recipes
  end

  def self.down
    rename_table :recipes, :receipes
  end
end
