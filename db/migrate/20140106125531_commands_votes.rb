class CommandsVotes < ActiveRecord::Migration
  def change
    create_table :commands_votes, id: false do |t|
      t.integer :command_id
      t.integer :vote_id
    end
  end
end
