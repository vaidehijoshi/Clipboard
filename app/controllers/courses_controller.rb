class CoursesController < ApplicationController

  def create
    @teacher = current_user
    @school = @teacher.school
    @course = Course.create(name: params[:course][:name], school_id: @school.id)
    if @course.save
      flash[:notice] = "#{@course.name} successfully added!"
      redirect_to(:back)
    else
      flash[:alert] = "Course could not be created."
      redirect_to(:back)
    end
  end
end
