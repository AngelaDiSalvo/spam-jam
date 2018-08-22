class SpamEmailMailer < ApplicationMailer
  default from: 'test@example.com'

  def punch1(victim)
    @victim = victim
    mail(to: params[:victim][:real_email], subject: "test")
  end
end
