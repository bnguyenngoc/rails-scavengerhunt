# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  enum role: [:standard, :judge, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
  
end
