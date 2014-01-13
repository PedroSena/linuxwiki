class RemoveTitleFromCommands < ActiveRecord::Migration
  def change
    remove_column :commands, :title
  end
end
