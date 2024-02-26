# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table(:languages) do |t|
      t.string(:name)

      t.timestamps
    end
  end
end
