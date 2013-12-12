require 'votable'

class Command < ActiveRecord::Base
  include Votable

  belongs_to :user
  validates_presence_of :example
  validates_presence_of :description
end
