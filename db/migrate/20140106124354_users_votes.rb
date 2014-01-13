class UsersVotes < ActiveRecord::Migration
  def change
    create_table :users_votes, id: false do |t|
      t.integer :user_id
      t.integer :vote_id
    end
  end
end
