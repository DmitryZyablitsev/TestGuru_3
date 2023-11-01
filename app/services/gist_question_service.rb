class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params.to_json)
    OpenStruct.new(
      'html_url' => response&.html_url,
      'success?' => response.html_url.present?
    )
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['OCTOKIT_TEST_GITHUB_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t(".services.gist_question_service.description", title: @test.title).to_s,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }    
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
