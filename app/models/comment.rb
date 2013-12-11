require 'votable'

class Comment < ActiveRecord::Base
  include Votable
  belongs_to :user

  validates_presence_of :content

end
