ThinkingSphinx::Index.define :command, with: :active_record, delta: ThinkingSphinx::Deltas::DelayedDelta do
  indexes example, explanation
  indexes user(:nickname), as: :author

  has user_id, created_at
end