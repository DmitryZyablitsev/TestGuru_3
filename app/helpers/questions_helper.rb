module QuestionsHelper
  def test_title(question)
    question.test.title
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: "_blank",  rel: 'nofollow', rel: 'noopener'    
  end
end
