# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    @teams = Team.all.order('name')
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team[:captain_id] = current_user.id
    if @team.save
      flash[:success] = 'Team was created'
      redirect_to teams_path
    else
      flash[:danger] = 'Error creating team'
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def update
    @team = Team.find(params[:id])
    authorize @team
    if @team.update(team_params)
      flash[:success] = 'Team updated successfully'
      redirect_to teams_path
    else
      flash[:danger] = 'Error updating team'
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    authorize @team

    if @team.destroy
      flash[:success] = 'Team deleted successfully'
      redirect_to teams_path
    else
      flash[:danger] = 'Error deleting challenge'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :tagline, :url, :captain_id)
  end
end
