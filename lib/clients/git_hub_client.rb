class GitHubClient

  ACCESS_TOKEN = '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'

  def initialize
    @client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def create_gist(params)
    @client.create_gist(params.to_json)
  end
end
