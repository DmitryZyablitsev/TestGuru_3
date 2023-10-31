class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all.order(:desc)
  end
end
