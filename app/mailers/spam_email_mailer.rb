class SpamEmailMailer < ApplicationMailer
  default from: 'test@example.com'

  def send_spam_email
    @url  = 'http://example.com/login'
    mail(to: params[:victim][:real_email], subject: "test", template_path: 'spam_emails', template_name: 'confirm')
  end
end
