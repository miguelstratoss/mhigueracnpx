class TripsController < ApplicationController
  def index
    @trips = Trip.where(:user_id => current_user.id).order('created_at DESC')
  end

  def show
    trip_id = params[:format]
    @trip = Trip.find(trip_id)
    @expenses = Expense.where(:trip_id => trip_id)
  end

  def new

  end
end
