# frozen_string_literal: true

class CreateTeamChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :team_challenges do |t|
      t.references :team, foreign_key: true
      t.references :challenge, foreign_key: true
      t.integer :score, default: 0
      t.text :submission
      t.integer :status
      t.boolean :done

      t.timestamps
    end
  end
end
