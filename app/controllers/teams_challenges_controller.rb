# frozen_string_literal: true

class TeamsChallengesController < ApplicationController
  def show
    team_relation = TeamRelationship.where(user_id: current_user.id).first
    team = team_relation.present? ? Team.where(id: team_relation.team_id).first : Team.where(captain_id: current_user.id).first
    if team.blank?
      flash[:danger] = 'Must be in a team to submit challenges'
      redirect_to challenges_path
    end
    team_challenge = TeamChallenge.where(team_id: team.id, challenge_id: params[:id])
    @team_challenge = team_challenge.present? ? team_challenge : TeamChallenge.new(team_id: team.id, challenge_id: params[:id])
  end

  def submit
    @team_challenge = TeamChallenge.new(team_challenge_params)

    if @team_challenge.save
      flash[:success] = 'Challenge Submitted'
      redirect_to challenges_path
    else
      flash[:danger] = 'Error creating team'
      render 'show'
    end
  end

  private

  def team_challenge_params
    params.require(:team_challenge).permit(:team_id, :challenge_id, :score, :submission, :status, :done)
  end
end
