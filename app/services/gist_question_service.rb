class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response)
  end

  private

  def default_client
    GitHubClient.new
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

  class ResultObject
    def initialize(response = nil)
      @response = response
     end

    def html_url
      @response&.html_url
    end

    def success?
      html_url.present?
    end
  end
end
