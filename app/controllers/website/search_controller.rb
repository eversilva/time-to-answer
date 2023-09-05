class Website::SearchController < WebsiteController
    def questions
        @questions = Question.search(params[:term], params[:page])
    end
end
