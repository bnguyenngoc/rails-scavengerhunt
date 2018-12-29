# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

  belongs_to :team, dependent: :destroy
  enum role: [:standard, :judge, :admin]

  
  
end
