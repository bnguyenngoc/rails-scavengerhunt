# frozen_string_literal: true

class Challenge < ApplicationRecord
  has_many :team_challenges, dependent: :destroy
  validates :title, presence: true
  validates :score, presence: true
  enum challenge_type: %i[flag text picture video live url file]
end
