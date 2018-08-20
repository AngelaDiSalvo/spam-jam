class VictimsController < ApplicationController
  before_action :set_victim, only: [:show, :edit, :update, :destroy]

  def index
    @victims = Victim.all
  end

  def show
  end

  def new
    @victim = Victim.new
  end

  def edit
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

  def update
    respond_to do |format|
      if @victim.update(victim_params)
        format.html { redirect_to @victim, notice: 'Victim was successfully updated.' }
        format.json { render :show, status: :ok, location: @victim }
      else
        format.html { render :edit }
        format.json { render json: @victim.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @victim.destroy
    respond_to do |format|
      format.html { redirect_to victims_url, notice: 'Victim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_victim
      @victim = Victim.find(params[:id])
    end

    def victim_params
      params.require(:victim).permit(:name, :real_email)
    end
end
