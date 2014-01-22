class Search < ActiveRecord::Base
  validates_presence_of :content

  scope :with_results, -> { where(found_something: true) }
end
