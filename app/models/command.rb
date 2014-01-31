require 'friendly_id'

class Command < ActiveRecord::Base
  include FriendlyId

  friendly_id :explanation, use: :slugged

  [:example, :explanation, :user_id].each do |attr|
    validates_presence_of attr
  end

  belongs_to :user
  has_and_belongs_to_many :votes

  def creator
    self.user.nickname
  end

  alias_method :author, :creator

  def creator_id
    self.user.id
  end
end
