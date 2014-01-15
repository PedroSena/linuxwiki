class Search < ActiveRecord::Base
  validates_presence_of :content

  scope :last_five, -> { limit(5).order(created_at: :desc) }
end
