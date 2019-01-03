# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  attr_reader :user

  def edit?
    user.role == 'admin' || record.id == user.id if user.present?
  end

  def update?
    (user.role == 'admin') || (record.id == user.id)
  end
end
