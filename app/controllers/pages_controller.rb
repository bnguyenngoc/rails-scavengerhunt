# frozen_string_literal: true

class PagesController < ApplicationController
  def main
    @user = User.new
  end
end
