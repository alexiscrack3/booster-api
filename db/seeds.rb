# frozen_string_literal: true

Language.delete_all

10.times do
  Language.create!(
    name: Faker::Nation.language,
  )
end
