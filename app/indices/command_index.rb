ThinkingSphinx::Index.define :command, with: :active_record do
  indexes example, description

  has votes
end