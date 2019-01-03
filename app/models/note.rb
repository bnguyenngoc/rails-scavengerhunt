# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :team_challenge
  belongs_to :user

  validates :content, presence: true
end
