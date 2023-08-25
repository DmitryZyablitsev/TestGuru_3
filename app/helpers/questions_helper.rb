module QuestionsHelper
  def question_header(test)
    case params[:action]
    when 'edit'
      "Edit #{test} Question"
    when 'new'
      "Create New #{test} Question"    
    end
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: "_blank",  rel: 'nofollow', rel: 'noopener'    
  end
end
