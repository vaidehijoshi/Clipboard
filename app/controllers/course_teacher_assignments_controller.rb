class CourseTeacherAssignmentsController < ApplicationController
  def create
    @course_teacher_assignment = CourseTeacherAssignment.create(course_id: params[:course_teacher_assignment][:course_id], teacher_id: params[:course_teacher_assignment][:teacher_id])
    if @course_teacher_assignment.save
      flash[:notice] = "#{current_user.full_name} has been added to #{@course_teacher_assignment.course.name}!"
      redirect_to(:back)
    else
      flash[:alert] = "Error in saving!"
      redirect_to(:back)
    end
  end
end
