class Command < ActiveRecord::Base
  [:example, :title, :explanation, :user_id].each do |attr|
    validates_presence_of attr
  end

  belongs_to :user
  has_and_belongs_to_many :votes

  def creator
    self.user.nickname
  end

  alias_method :author, :creator
end
