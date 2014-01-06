class Command < ActiveRecord::Base
  [:example, :title, :explanation, :user_id].each do |attr|
    validates_presence_of attr
  end

  belongs_to :user
end
