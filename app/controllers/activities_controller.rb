class ActivitiesController < ApplicationController
   def new
    @day = Day.find(params[:day_id])
    @activity = @day.activities.build
  end

  def create
    day = Day.find(params[:day_id])
    activity = day.activities.create(activity_params)
    if activity.save
      redirect_to itinerary_path(day.itinerary)
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @itinerary = @activity.day.itinerary
    @user = @itinerary.users[0]
  end

  def edit
    @activity = Activity.find(params[:id])
    user = @activity.day.itinerary.users[0]
    if user == current_user
      render :edit
    else 
      redirect_to activity_path(@activity)
    end
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    day = @activity.day
    redirect_to day_activity_path(day, @activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    user = @activity.day.itinerary.users[0]
    if user == current_user
      @activity.destroy
      redirect_to itinerary_path(@activity.day.itinerary)
    else 
      redirect_to user_path(user)
    end
  end
  
  private 

  def activity_params
    params.require(:activity).permit(:title, :activity_type, :address, :url, :notes)
  end
end