class VictimsController < ApplicationController
  before_action :set_victim, only: [:show]

  def index
    @victims = Victim.all
  end

  def show
  end

  def new
    @victim = Victim.new
  end

  def create
    @victim = Victim.new(victim_params)

    respond_to do |format|
      if @victim.save
        format.html { redirect_to @victim, notice: 'Victim was successfully created.' }
        format.json { render :show, status: :created, location: @victim }
      else
        format.html { render :new }
        format.json { render json: @victim.errors, status: :unprocessable_entity }
      end
    end
  end

  def bam

  end

  private

    def set_victim
      @victim = Victim.find(params[:id])
    end

    def victim_params
      params.require(:victim).permit(:name, :real_email)
    end
end
