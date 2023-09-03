class Website::SearchController < WebsiteController
    def questions
        @question = Question.all.page(params[:page]).per(10)
    end
end
