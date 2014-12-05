class EmailController < ApplicationController

  def course_section
    @course_section = CourseSection.find(params[:class_id])
    templates = Dir[Rails.root + "app/views/teacher_mailer/templates/*"].map{ |file| file.split("/").last.sub(".text.erb", "")}
    @templates = templates.map{ |temp| [temp.split("_").map(&:capitalize).join(" "), temp]}
  end

  def course_section_send
    guardian_emails = Guardian.where(student_id: params[:email][:student_ids_for_guardians]).pluck(:email)
    students = Student.where(id: params[:email][:student_ids])
    student_emails = students.pluck(:email)
    recipient_emails = guardian_emails + student_emails

    if params[:email][:template] == ""
      TeacherMailer.custom_email(current_user, recipient_emails, params[:email][:subject], params[:email][:body]).deliver
    else
      TeacherMailer.template_email(current_user, recipient_emails, params[:email][:template]).deliver
    end
    redirect_to :back
  end


  # private
  # def email_params
  #   params.require(:email).permit(:student_ids, :student_ids_for_guardians, :subject, :body)
  # end

end
