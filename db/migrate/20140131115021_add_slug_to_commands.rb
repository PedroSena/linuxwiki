class AddSlugToCommands < ActiveRecord::Migration
  def change
    add_column :commands, :slug, :string
  end
end
