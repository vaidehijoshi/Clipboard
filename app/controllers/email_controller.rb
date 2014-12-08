class EmailController < ApplicationController

  def course_section
    @course_section = CourseSection.find(params[:class_id])
    templates = Dir[Rails.root + "app/views/teacher_mailer/templates/*"].map{ |file| file.split("/").last.sub(".text.erb", "").sub(".html.erb", "")}.uniq
    @templates = templates.map{ |temp| [temp.split("_").map(&:capitalize).join(" "), temp]}
  end

  def course_section_send
    @course_section = CourseSection.find(params[:class_id])
    @guardians = Guardian.where(student_id: params[:email][:guardian_ids])
    guardian_emails = @guardians.pluck(:email)
    @students = Student.where(id: params[:email][:student_ids])
    student_emails = @students.pluck(:email)
    student_first_names = @students.pluck(:first_name)
    student_last_names = @students.pluck(:last_name)
    recipient_emails = guardian_emails + student_emails

    if params[:email][:template] == ""
      TeacherMailer.custom_email(current_user, recipient_emails, params[:email][:subject], params[:email][:body]).deliver
    else
      @guardians.each do |guardian|
        TeacherMailer.template_email(@course_section, guardian, guardian.student, current_user, guardian.email, params[:email][:template]).deliver
      end
      @students.each do |student|
        TeacherMailer.template_email(@course_section, student.guardians.first, student, current_user, student.email, params[:email][:template]).deliver
      end
    end
    redirect_to :back
  end


  # private
  # def email_params
  #   params.require(:email).permit(:student_ids, :guardian_ids, :subject, :body)
  # end

end


