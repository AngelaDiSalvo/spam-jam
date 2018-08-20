class SpamTypesController < ApplicationController
  before_action :set_spam_type, only: [:show]

  def index
    @spam_types = SpamType.all
  end

  def show
  end

  def new
    @spam_type = SpamType.new
  end

  def create
    @spam_type = SpamType.new(spam_type_params)

    respond_to do |format|
      if @spam_type.save
        format.html { redirect_to @spam_type, notice: 'Spam type was successfully created.' }
        format.json { render :show, status: :created, location: @spam_type }
      else
        format.html { render :new }
        format.json { render json: @spam_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_spam_type
      @spam_type = SpamType.find(params[:id])
    end

    def spam_type_params
      params.require(:spam_type).permit(:name)
    end
end
