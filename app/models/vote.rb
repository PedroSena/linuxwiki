class Vote < ActiveRecord::Base
  validates_presence_of :user_id
  validates_numericality_of :user_id

  belongs_to :user
end
