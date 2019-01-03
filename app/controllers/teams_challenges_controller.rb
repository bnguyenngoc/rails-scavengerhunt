# frozen_string_literal: true

class TeamsChallengesController < ApplicationController
  def show
    team_relation = TeamRelationship.where(user_id: current_user.id).first
    # @challenge = Challenge.find(params[:id])
    team = team_relation.present? ? Team.where(id: team_relation.team_id).first : Team.where(captain_id: current_user.id).first
    if team.blank?
      flash[:danger] = 'Must be in a team to submit challenges'
      redirect_to challenges_path
    end
    team_challenge = TeamChallenge.where(team_id: team.id, challenge_id: params[:id]).first
    @team_challenge = team_challenge.present? ? team_challenge : TeamChallenge.new(team_id: team.id, challenge_id: params[:id])
  end

  def submit
    challenge = TeamChallenge.new(team_challenge_params)
    @team_challenge = TeamChallenge.where(team_id: challenge.team_id, challenge_id: challenge.challenge_id).first.presence || challenge
    # if team_challenge has an id, we will update instead of saving
    if @team_challenge.id
      if @team_challenge.update(team_challenge_params)
        flash[:success] = 'Challenge updated'
        redirect_to challenges_path
      else
        flash[:danger] = 'Error creating team'
        render 'show'
      end
    else
      if @team_challenge.save
        flash[:success] = 'Challenge Submitted'
        redirect_to challenges_path
      else
        flash[:danger] = 'Error creating team'
        render 'show'
      end
    end
  end

  def index
    @team_challenges = TeamChallenge.all.order('created_at')
    authorize @team_challenges
  end

  def edit
    @team_challenge = TeamChallenge.find(params[:id])
    @note = Note.new(team_challenge_id: @team_challenge.id)
    @notes = Note.where(team_challenge_id: @team_challenge.id)
    render 'show'
  end

  private

  def team_challenge_params
    params.require(:team_challenge).permit(:team_id, :challenge_id, :score, :submission, :status, :done)
  end
end
