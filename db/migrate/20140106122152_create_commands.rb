class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :example
      t.string :explanation
      t.string :title

      t.timestamps
    end
  end
end
