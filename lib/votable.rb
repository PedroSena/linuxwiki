module Votable

  def self.included(base_class)
    base_class.instance_eval do
      validates_presence_of :votes
      validates_numericality_of :votes, only_integer: true

      after_initialize do
        self.votes = 0
      end
    end

  end

end