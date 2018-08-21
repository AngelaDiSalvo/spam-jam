class SpamTypesController < ApplicationController
  before_action :set_spam_type, only: [:show]

  def index
    @spam_types = SpamType.all
  end

  def show
  end

  private
    def set_spam_type
      @spam_type = SpamType.find(params[:id])
    end

    def spam_type_params
      params.require(:spam_type).permit(:name)
    end
end
