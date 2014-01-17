class AddDeltaToCommands < ActiveRecord::Migration
  def change
    add_column :commands, :delta, :boolean, default: true, null: false
    add_index :commands, :delta
  end
end
