class ClockedTimeController < ApplicationController
  TIME_REGEX = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])) ([01]?[0-9]|2[0-3]):[0-5][0-9]/
  def index
     
    @clocked_times = ClockedTime.where(user_id: current_user.id)
    render json: @clocked_times
  end

  def create
    # check to validate the time format
    time = permitted_params[:time].to_datetime
    action = permitted_params[:action]
    unless time.match?(TIME_REGEX)
      render json: {"errors" : "Time format is wrong"}, status: :unprocessable_entity
    end
    @clocked_time = ClockedTime.create(time: time, action: action, user_id: current_user.id)
    if @clocked_time.save
      render json: @clocked_time, status: :created
    else
      render json: @clocked_time.errors, status: :unprocessable_entity
    end
  end

  def update
    clocked_time_id = permitted_params[:id]
    @clocked_time = ClockedTime.find_by(id: clocked_time_id)
    if @clocked_time
      # check to validate the time format
      time = permitted_params[:time].to_datetime
      unless time.match?(TIME_REGEX)
        render json: {"errors" : "Time format is wrong"}, status: :unprocessable_entity
      end
      action = permitted_params[:action]  
      @clocked_time.update(time: time, action: action)
      render json: @clocked_time, status: :ok
    else
      render json: {}, status: :not_found
    end
    time = permitted_params[:time]
    action = permitted_params[:action]
  end

  def followee_sleep_timings
    pass 
  end

  private
  
  def permitted_params
    params.require(:clocked_time).permit(:time, :action)
  end
end
