class SchoolsController < ApplicationController
  def index
    @teacher = Teacher.new
  end

  def create
    @teacher = current_user
    @school = @teacher.create_school(name: params[:school][:name])
    if @school.save
      @teacher.school_id = @school.id
      @teacher.save
      flash[:notice] = "School created!"
      redirect_to(:back)
    else
      flash[:alert] = "School could not be created."
      redirect_to(:back)
    end
  end
end
