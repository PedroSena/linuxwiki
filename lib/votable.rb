
module Votable

  def self.included(base_class)
    base_class.validates_presence_of :votes
    base_class.validates_numericality_of :votes, only_integer: true

    base_class.after_initialize do
      @votes = 0
    end
  end

end