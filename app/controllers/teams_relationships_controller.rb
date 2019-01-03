# frozen_string_literal: true

class TeamsRelationshipsController < ApplicationController
  def join
    team_relationship = TeamRelationship.new(user_id: current_user.id, team_id: params[:id])
    if team_relationship.save
      flash[:success] = 'Joined team successfully'
      redirect_to teams_path
    else
      flash[:danger] = 'Error joining team'
      redirect_to teams_path
    end
  end

  def leave
    team_relationship = TeamRelationship.where(user_id: current_user.id, team_id: params[:id])
    if team_relationship.destroy
      flash[:success] = 'Left team successfully'
      redirect_to teams_path
    else
      flash[:danger] = 'Error leaving team'
      redirect_to teams_path
    end
  end

  private

  def team_relationship_params
    params.require(:teams_relationship).permit(:user_id, :team_id)
  end
end
