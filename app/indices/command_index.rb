ThinkingSphinx::Index.define :command, with: :active_record do
  indexes example, description
  indexes user(:name), as: :author, type: :string

  has votes, created_at
end