# frozen_string_literal: true

class TeamChallenge < ApplicationRecord
  belongs_to :team
  belongs_to :challenge
  has_many :notes, dependent: :destroy

  validates :team_id, presence: true
  validates :challenge_id, presence: true

  enum status: %i[wip pending rework done abandon]
end
