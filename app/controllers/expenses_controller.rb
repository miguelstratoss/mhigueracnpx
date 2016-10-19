class ExpensesController < ApplicationController
  def new
    puts params.inspect
    @trip_id = params[:format]
    @trip = Trip.find(@trip_id)
  end

  def create
    if Expense.create(:trip_id => params[:trip_id], :name => params[:name], :value => params[:value])
      flash[:notice] = "Expense successfully created"
      redirect_to trips_show_path(params[:trip_id])
    else
      flash[:alert] = "ERROR - Expense was NOT created"
      redirect_to trips_show_path(params[:trip_id])
    end
  end
end
