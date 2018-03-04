class DaysController < ApplicationController
  before_action :authenticate_user!

  def new
    @day = Day.new
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = @itinerary.days.create(days_params)
    if @day.save
      redirect_to itinerary_path(params[:itinerary_id])
    else
      @errors = @day.errors
      render :new
    end
  end

  def show
    @day = Day.find(params[:id])
  end

  def edit
    @day = Day.find(params[:id])
    @itinerary = @day.itinerary
    if @itinerary.users[0] == current_user
      render :edit
    else 
      redirect_to day_path(@day)
    end
  end

  def update
    @day = Day.find(params[:id])
    @day.update(days_params)
    redirect_to itinerary_path(@day.itinerary)
  end

  def destroy
    @day = Day.find(params[:id])
    user = @day.itinerary.users[0]
    if user == current_user
      @day.destroy
      redirect_to itinerary_path(@day.itinerary)
    else 
      redirect_to user_path(user)
    end
  end

  private

  def days_params
    params.require(:day).permit(:title, :date)
  end
end