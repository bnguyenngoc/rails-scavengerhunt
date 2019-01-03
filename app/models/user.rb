# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  after_initialize do
    self.role ||= :standard if new_record?
  end

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_one :team, through: :team_relationships, source: :team
  enum role: %i[standard judge admin]
end
