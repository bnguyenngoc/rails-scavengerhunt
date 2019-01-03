# frozen_string_literal: true

class RemoveScoreFromTeamAndAddTypeToChallenge < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :score
    add_column :challenges, :type, :integer, default: 0
  end
end
