require 'votable'

class Command < ActiveRecord::Base
  include Votable

  belongs_to :user
  validates_presence_of :example
end
