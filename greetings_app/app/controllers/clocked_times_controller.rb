class ClockedTimesController < ApplicationController
  TIME_REGEX = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])) ([01]?[0-9]|2[0-3]):[0-5][0-9]/
  def index
     
    @clocked_times = ClockedTime.where(user_id: current_user.id)
    # render json: @clocked_times
  end

  def create
    time = permitted_params[:time]
    action = permitted_params[:action]
    unless time.match?(TIME_REGEX)
      @errors = {"errors": "Time format is wrong"}
      render json: @errors, status: :unprocessable_entity
    end

    time = permitted_params[:time].to_datetime
    time_spent = 0
    if action == 'sleep'
      recent_activity = ClockedTime.where(user_id: current_user.id)
                                   .where('time < ?', time ).order(time: :desc)&.first
      if recent_activity.present? && recent_activity.action == 'awake'
        time_spent =  ((time.to_i - recent_activity.time.to_i)/1.minutes).round
      end
    elsif action == 'awake'
      recent_activity = ClockedTime.where(user_id: current_user.id).where('time < ?', time ).order(time: :desc)&.first
      if recent_activity.present? && recent_activity.action == 'sleep'
        time_spent =  ((time.to_i - recent_activity.time.to_i)/1.minutes).round
      end
    end

    @clocked_time = ClockedTime.create(time: time, action: action, 
                                       user_id: current_user.id,
                                       time_spent: time_spent)
    if @clocked_time.save
      render json: @clocked_time, status: :created
    else
      render json: @clocked_time.errors, status: :unprocessable_entity
    end
  end

  def followee_sleep_timings
    followee_user_ids = Follower.where(follower_id: current_user.id).pluck(:followee_id).uniq.compact
    end_time = Time.zone.now
    start_time = Time.zone.now - 7.days 
    @followee_sleep_timings =  ClockedTime.where(user_id: followee_user_ids)
                                          .where(action: 'awake').group(:user_id)
                                          .select(:user_id).order('sum_time_spent desc').sum(:time_spent)
  end

  private
  
  def permitted_params
    params.require(:clocked_time).permit(:time, :action)
  end
end
