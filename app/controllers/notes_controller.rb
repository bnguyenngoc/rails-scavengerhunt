# frozen_string_literal: true

class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note[:user_id] = current_user.id
    if @note.save
      flash[:success] = 'Created note successfully'
      redirect_to edit_teams_challenge_path(@note.team_challenge_id)
    else
      flash[:danger] = 'Error creating note'
      redirect_to edit_teams_challenge_path(@note.team_challenge_id)
    end
  end

  def update; end

  def destroy; end

  private

  def note_params
    params.require(:note).permit(:team_challenge_id, :content)
  end
end
