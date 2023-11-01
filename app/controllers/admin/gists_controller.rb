class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.order(:desc)
  end
end
