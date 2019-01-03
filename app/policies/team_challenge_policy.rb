# frozen_string_literal: true

class TeamChallengePolicy < ApplicationPolicy
  attr_reader :user

  def index?
    user.role == 'admin' || user.role == 'judge'
  end
end
