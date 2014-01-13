class AddUserIdToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :user_id, :integer
  end
end
