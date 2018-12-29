class TeamsRelationshipsController < ApplicationController
  def join
    team_relationship = TeamRelationship.new(team_relationship_params)
    if team_relationship.save
      flash[:success] = 'Joined team successfully'
    else
      flash[:danger] = 'Error joining team'
    end
  end

  def leave
    team_relationship = TeamRelationship.where(user_id: current_user.id, team_id: params[:id])
    if team_relationship.destroy
      flash[:success] = 'Left team successfully'
    else
      flash[:danger] = 'Error leaving team'
    end
  end

  private

  def team_relationship_params
    params.require(:teams_relationship).permit(:user_id, :team_id)
  end
end
