# frozen_string_literal: true

class TeamRelationship < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :team_id, presence: true
end
