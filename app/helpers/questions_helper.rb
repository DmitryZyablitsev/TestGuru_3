module QuestionsHelper
  def question_header(question)
    test_title = question.test.title
    return "Edit #{test_title} Question" if question.persisted?
    "Create New #{test_title} Question" if question.new_record?
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: "_blank",  rel: 'nofollow', rel: 'noopener'    
  end
end
