class AssignmentsController < ApplicationController
  def show
    #binding.pry
    @assignment = Assignment.find(params[:id])
  end

  def create
    Assignment.create(name: params[:name], points: params[:points], date_assigned: params[:date_assigned], date_due: params[:date_due], course_section_id: params[:class_id], category: params[:category])
    redirect_to(:back)
  end

end
