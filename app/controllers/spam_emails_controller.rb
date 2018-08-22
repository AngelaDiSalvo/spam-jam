class SpamEmailsController < ApplicationController
  before_action :set_spam_email, only: [:show]

  def index
    @spam_emails = SpamEmail.all
  end

  def show
  end

  def new1
  end

  def new
    session[:spam_type_id] = params[:spam_type_id]
    redirect_to '/new/2'
  end

  def dog
    @spam_type = SpamType.find(session[:spam_type_id])
    @spam_email = SpamEmail.new

    render :new
  end

  def create
    @spam_type = SpamType.find(session[:spam_type_id])
    @user = User.create(name: params[:spam_email][:user_name], real_email: params[:spam_email][:user_real_email])
    @victim = Victim.create(name: params[:spam_email][:victim_name], real_email: params[:spam_email][:victim_real_email])

    @spam_email = SpamEmail.create(contents: params[:spam_email][:contents] , user_id: @user.id , victim_id: @victim.id , spam_type_id: @spam_type.id)


    respond_to do |format|
      if @spam_email.valid? && @user.valid? && @victim.valid?
        SpamEmailMailer.with(victim: @victim).punch1(@victim).deliver_now
        format.html { render :confirm, notice: 'Spam email was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_spam_email
      @spam_email = SpamEmail.find(params[:id])
    end

    def spam_email_params
      params.require(:spam_email).permit(:contents, :spam_type_id, :victim_id, :user_id)
    end
end
