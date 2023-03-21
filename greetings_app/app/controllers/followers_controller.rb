class FollowersController < ApplicationController
  def index
    #get list of followers
    @followees = Follower.where(follower_id: current_user.id)
    render json: @followees
  end

  def post
    @followee_id = params[:followee_id].to_i
    ActiveRecord::Base.transaction do
      follwer_obj = Follower.create!(follower_id: current_user.id, followee_id: @followee_id)
      follwee_obj = Follower.create!(followee_id: current_user.id, follower_id: @followee_id)
    end
    render json: @followee_id, status: created 
  end

  def destroy
    followee_id = params[:followee_id].to_i
    @followees = Follower.where(follower_id: current_user.id)
    @followers = Follower.where(followee_id: followee_id)

    ActiveRecord::Base.transaction do
      @followees.destroy_all
      @followers.destroy_all 
    end
  end
end
