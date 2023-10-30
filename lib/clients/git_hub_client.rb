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
