ThinkingSphinx::Index.define :command, with: :active_record do
  indexes example, explanation
  indexes user(:nickname), as: :author

  has user_id, created_at
end