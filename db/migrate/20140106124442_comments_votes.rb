class CommentsVotes < ActiveRecord::Migration
  def change
    create_table :comments_votes, id: false do |t|
      t.integer :comment_id
      t.integer :vote_id
    end
  end
end
