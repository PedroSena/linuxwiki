require 'votable'

class Command < ActiveRecord::Base
  include Votable

  belongs_to :user
  validates_presence_of :example
  validates_presence_of :description

  def creator
    self.user.name
  end

  alias_method :author, :creator

end
