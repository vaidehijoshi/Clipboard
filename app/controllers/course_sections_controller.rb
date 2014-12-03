class CourseSectionsController < ApplicationController
  def show
    @class = CourseSection.find(params[:id])
  end

  def new
    @course_section = CourseSection.new(course_teacher_assignment_id: params[:course_section][:course_teacher_assignment_id])
    session[:course_teacher_assignment_id] = params[:course_section][:course_teacher_assignment_id]
  end


  def create
    #binding.pry
    @course_section = CourseSection.create(course_teacher_assignment_id: session[:course_teacher_assignment_id], name: params[:course_section][:name])
    if @course_section.save
      flash[:notice] = "Class successfully created!"
      redirect_to course_section_path(@course_section)
    else
      flash.now[:alert] = "Class could not be created!"
      render :new
    end
  end

  def update
    @course_section = CourseSection.find(params[:id])
    @course_section.update(course_section_params)
    flash[:notice] = "Class succesfully updated!"
    redirect_to(:back)
  end

  private
    def course_section_params
      params.require(:course_section).permit(:name)
    end

end
