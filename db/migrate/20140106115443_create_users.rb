class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :openID
      t.string :email
      t.string :nickname

      t.timestamps
    end
  end
end
