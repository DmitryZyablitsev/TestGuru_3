class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
  end
  
  private

  def gist_params
    params.require(:gist).permit(:question_id, :author_id, :gist_url)
  end
end
