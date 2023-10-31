class GitHubClient

  def initialize
    @client = setup_client
  end

  def create_gist(params)
    @client.create_gist(params.to_json)
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ENV['OCTOKIT_TEST_GITHUB_TOKEN'] )
  end
end
