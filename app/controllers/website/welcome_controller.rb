class Website::WelcomeController < WebsiteController
  def index
    @questions = Question.includes(:answers).order('created_at desc').page(params[:page]).per(10)
  end
end
