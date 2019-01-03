# frozen_string_literal: true

class ChangeTypeNameInChallenge < ActiveRecord::Migration[5.2]
  def change
    rename_column :challenges, :type, :challenge_type
  end
end
