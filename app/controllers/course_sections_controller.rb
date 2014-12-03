class CourseSectionsController < ApplicationController
  def show
    @course_section = CourseSection.find(params[:id])
    @buddyship = @course_section.buddyships.new
    @enemyship = @course_section.enemyships.new
    @student_course_section = StudentCourseSection.new
    @assignment = @course_section.assignments.new
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @course_section = CourseSection.new(course_teacher_assignment_id: params[:course_section][:course_teacher_assignment_id])
    @course_teacher_assignment = CourseTeacherAssignment.find(params[:course_section][:course_teacher_assignment_id])
  end


  def create
    #binding.pry
    @teacher = Teacher.find(params[:teacher_id])
    @course_section = CourseSection.create(course_teacher_assignment_id: params[:course_section][:course_teacher_assignment_id], name: params[:course_section][:name])
    if @course_section.save
      flash[:notice] = "Class successfully created!"
      redirect_to teacher_class_path(@teacher, @course_section)
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
