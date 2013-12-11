class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :example
      t.integer :votes
      t.integer :user_id

      t.timestamps
    end
  end
end
