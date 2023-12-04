class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end

  def show
    @badge = Badge.find(params[:id])
    @pages_back = request.referrer
  end

  def obtained
    @obtained = UserBadge.where(user: current_user )
  end
end
