class StudentCourseSectionsController < ApplicationController

  def new
    @student_course_section = StudentCourseSection.new
  end

  def create
    @student_course_section = StudentCourseSection.create(student_course_section_params)
    @student = Student.find(student_course_section_params[:student_id])
    @course_section = CourseSection.find(student_course_section_params[:course_section_id])
    if @student_course_section.save 
      respond_to do |format|
        format.html { redirect_to teacher_class_path(current_user, @student_course_section.course_section_id) }
        format.js {}
      end 
    else
      respond_to do |format|
        format.html { redirect_to teacher_class_path(current_user, @student_course_section.course_section_id), alert: @student_course_section.errors.full_messages.last }
        format.js {}
      end 
    end
  end

  def destroy
    @student_course_section = StudentCourseSection.find(params[:id])
    @student = @student_course_section.student
    @student_course_section.destroy
    respond_to do |format|
      format.html {redirect_to teacher_class_path(current_user, @student_course_section.course_section_id)}
      format.js {}
    end
  end

  private

    def student_course_section_params
      params.require(:student_course_section).permit(:student_id, :course_section_id)
    end

end
