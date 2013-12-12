class AddDescriptionToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :description, :string
  end
end
