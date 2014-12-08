class TeacherMailer < ActionMailer::Base

  def custom_email(user, recipient_emails, subject, body)
    mail(from: user.full_name, reply_to: user.email, to: recipient_emails, subject: subject, body: body, cc: user.email)
  end

  def template_email(course_section, guardian, student, user, recipient_email, template)
    @course_section = course_section
    @guardian = guardian
    @student = student
    mail(from: user.full_name, reply_to: user.email, to: recipient_email, cc: user.email, template_path: "teacher_mailer/templates", template_name: template)
  end
  
end
