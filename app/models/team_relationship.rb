# frozen_string_literal: true

class TeamRelationship < ApplicationRecord
  belongs_to :team, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :team_id, presence: true
end
