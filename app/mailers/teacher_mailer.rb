class TeacherMailer < ActionMailer::Base

  def custom_email(user, recipient_emails, subject, body)
    mail(from: user.full_name, reply_to: user.email, to: recipient_emails, subject: subject, body: body, cc: user.email)
  end

  def template_email(user, recipient_emails, template)
    mail(from: user.full_name, reply_to: user.email, to: recipient_emails, cc: user.email, template_path: "teacher_mailer/templates", template_name: template)
    @students = user.stundents
  end
  
end
