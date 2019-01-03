# frozen_string_literal: true

class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all.order('title')
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    authorize @challenge
    if @challenge.save
      flash[:success] = 'Challenge was successfully created'
      redirect_to challenges_path
    else
      flash[:danger] = 'Error creating challenge'
      render 'new'
    end
  end

  def show; end

  def edit
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def update
    @challenge = Challenge.find(params[:id])
    authorize @challenge
    if @challenge.update(challenge_params)
      flash[:success] = 'Challenge updated succesfully'
      redirect_to challenges_path
    else
      flash[:danger] = 'Error updating challenge'
      render 'edit'
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    authorize @challenge

    if @challenge.destroy
      flash[:success] = 'Challenge deleted successfully'
      redirect_to challenges_path
    else
      flash[:danger] = 'Error deleting challenge'
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :judgenote, :score, :keywor, :published)
  end
end
