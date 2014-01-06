class Comment < ActiveRecord::Base
  [:content, :user_id, :command_id].each do |attr|
    validates_presence_of attr
  end
  validates_numericality_of :user_id
  validates_numericality_of :command_id

  belongs_to :user
  belongs_to :command
  has_and_belongs_to_many :votes
end
