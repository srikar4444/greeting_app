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

  # def update
  #   clocked_time_id = permitted_params[:id]
  #   @clocked_time = ClockedTime.find_by(id: clocked_time_id)
  #   if @clocked_time
  #     time = permitted_params[:time]
  #     unless time.match?(TIME_REGEX)
  #       render json: {"errors": "Time format is wrong"}, status: :unprocessable_entity
  #     end

  #     time = permitted_params[:time].to_datetime
  #     action = permitted_params[:action]  
  #     time_spent = 0
  #     if action == 'sleep'
  #       recent_activity = ClockedTime.where('time < ?', time ).order(time: :desc)
  #       if recent_activity && recent_activity.action == 'awake'
  #         time_spent = (time - recent_activity.time) / 1.minutes
  #       end
  #     elsif action == 'awake'
  #       recent_activity = ClockedTime.where('time < ?', time ).order(time: :desc)
  #       if recent_activity && recent_activity.action == 'sleep'
  #         time_spent = (time - recent_activity.time) / 1.minutes
  #       end
  #     end

  #     @clocked_time.update(time: time, action: action, time_spent: time_spent)
  #     render json: @clocked_time, status: :ok
  #   else
  #     render json: {}, status: :not_found
  #   end
  #   time = permitted_params[:time]
  #   action = permitted_params[:action]
  # end

  def followee_sleep_timings
    
    
  end

  private
  
  def permitted_params
    params.require(:clocked_time).permit(:time, :action)
  end
end
