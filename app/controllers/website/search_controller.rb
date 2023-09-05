class Website::SearchController < WebsiteController
    def questions
        @questions = Question.includes(:answers)
                            .where('lower(description) LIKE ?', "%#{params[:term].downcase}%")
    end
end
