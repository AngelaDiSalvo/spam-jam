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
    # @spam_type = SpamType.find(params[:spam_type_id])
    # @spam_email = SpamEmail.new
    redirect_to '/new/2'


  end
  def dog
    @spam_type = SpamType.find(session[:spam_type_id])
    @spam_email = SpamEmail.new

    render :new
  end

  def create

    @spam_email = SpamEmail.new(spam_email_params)
    @user = User.new(spam_email_params)
    byebug
    respond_to do |format|
      if @spam_email.save
        format.html { redirect_to @spam_email, notice: 'Spam email was successfully created.' }
        format.json { render :show, status: :created, location: @spam_email }
      else
        format.html { render :new }
        format.json { render json: @spam_email.errors, status: :unprocessable_entity }
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
