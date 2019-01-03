# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :team_challenge, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
