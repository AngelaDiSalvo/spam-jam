class SpamEmailsController < ApplicationController
  before_action :set_spam_email, only: [:show, :edit, :update, :destroy]

  def index
    @spam_emails = SpamEmail.all
  end

  def show
  end

  def new
    @spam_email = SpamEmail.new
  end

  def edit
  end

  def create
    @spam_email = SpamEmail.new(spam_email_params)

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

  def update
    respond_to do |format|
      if @spam_email.update(spam_email_params)
        format.html { redirect_to @spam_email, notice: 'Spam email was successfully updated.' }
        format.json { render :show, status: :ok, location: @spam_email }
      else
        format.html { render :edit }
        format.json { render json: @spam_email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spam_email.destroy
    respond_to do |format|
      format.html { redirect_to spam_emails_url, notice: 'Spam email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_spam_email
      @spam_email = SpamEmail.find(params[:id])
    end

    def spam_email_params
      params.require(:spam_email).permit(:contents)
    end
end
