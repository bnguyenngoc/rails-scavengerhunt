# frozen_string_literal: true

class Team < ApplicationRecord
  has_one :captain, class_name: 'User'
  has_many :users, through: :team_relationships
  has_many :team_challenges

  validates :name, presence: true, length: { maximum: 140 }
end
