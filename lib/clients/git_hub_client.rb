class GitHubClient

  ACCESS_TOKEN = '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'

  def initialize
    @client = setup_client
  end

  def create_gist(params)
    @client.create_gist(params.to_json)
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ACCESS_TOKEN )
  end
end
