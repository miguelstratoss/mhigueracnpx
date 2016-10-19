class ExpenseTagsController < ApplicationController
  def new
    @expense_id = params[:format]
    @expense = Expense.find(@expense_id)
    @tags = Tag.all
  end

  def create
    if ExpenseTag.create(:expense_id => params[:expense_id], :tag_id => params[:tag_id])
      flash[:notice] = "Tag successfully added"
      redirect_to trips_show_path(params[:trip_id])
    else
      flash[:alert] = "ERROR - The Tag was NOT added"
      redirect_to trips_show_path(params[:trip_id])
    end
  end
end
