class EmailController < ApplicationController

  def course_section
    @course_section = CourseSection.find(params[:class_id])
  end

  def course_section_send
    students_for_guardians = Student.where(id: params[:email][:student_ids_for_guardians])
    guardian_emails = students_for_guardians.map{ |student| student.guardians.pluck(:email)}.flatten
    students = Student.where(id: params[:email][:student_ids])
    student_emails = students.pluck(:email)
    recipient_emails = guardian_emails + student_emails
    TeacherMailer.custom_email(current_user, recipient_emails, params[:email][:subject], params[:email][:body]).deliver
    redirect_to :back
  end


  # private
  # def email_params
  #   params.require(:email).permit(:student_ids, :student_ids_for_guardians, :subject, :body)
  # end

end
