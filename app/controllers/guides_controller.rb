class GuidesController < ApplicationController
  before_action :authenticate_user!, only: [:new] #:edit, :destroy
  def index
    @guides = Guide.includes(:user).order('created_at DESC')
  end

  def new
    @guide = Guide.new
  end
  
  def create
    @guide = Guide.new(guide_params)
    if @guide.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def guide_params
    params.require(:guide).permit(:title, :content, :notice, :image).merge(user_id: current_user.id)
  end
end
