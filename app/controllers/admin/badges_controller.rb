class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!

  def new
    @badge = Badge.new
    @available_levels = Test.available_levels.to_set
  end
  
  def create
    @badge = Badge.create!(badge_params)
    if @badge.save
      redirect_to badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_url, :description, :rule_type, :rule_value)
  end
end
