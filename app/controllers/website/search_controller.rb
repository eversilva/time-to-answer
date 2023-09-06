class Website::SearchController < WebsiteController
    def questions
        @questions = Question.includes(:answers).search_term(params[:term], params[:page])
    end
end
