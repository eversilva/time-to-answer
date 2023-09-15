class Website::SearchController < WebsiteController
    def questions
        @questions = Question.includes(:answers)._search_term_(params[:term], params[:page])
    end

    def subject 
        @questions = Question._search_subject_(params[:subject_id], params[:page])
        @subject = Subject.find(params[:subject_id])
    end
end
