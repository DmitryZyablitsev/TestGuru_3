class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end
  
  def create
    @badge = Badge.create!(badge_params)
    if @badge.save
      redirect_to badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def show
    @badge = Badge.find(params[:id])
    @pages_back = request.referrer
  end

  def obtained
    @obtained = UserBadge.where(user: current_user )
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_url, :description)
  end
end
