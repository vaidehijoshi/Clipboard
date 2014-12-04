class TeacherMailer < ActionMailer::Base
  default from: 'flatiron.clipboard@gmail.com'

  def custom_email(user, recipient_emails, subject, body)
    mail(to: recipient_emails, subject: subject, body: body)
  end
end
