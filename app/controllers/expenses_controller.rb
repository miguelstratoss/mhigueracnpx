class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @expense.trip_id = params[:format]
  end

  def create
  end
end
