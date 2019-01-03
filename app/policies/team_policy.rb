# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  attr_reader :user, :team

  def initialize(user, team)
    @user = user || User.new
    @team = team
  end

  def edit?
    user.role == 'admin' || team.captain_id == user.id
  end

  def update?
    user.role == 'admin' || team.captain_id == user.id
  end

  def destroy?
    user.role == 'admin' || team.captain_id == user.id
  end
end
