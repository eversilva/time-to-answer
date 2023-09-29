class Website::AnswerController < WebsiteController
  def question
    @answer = Answer.find(params[:answer_id])
    set_user_statistic(@answer)
  end

  private 

  def set_user_statistic(answer)
    if user_signed?
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      if answer.correct? ? user_statistic.correct_questions += 1 : user_statistic.incorrect_questions += 1
      user_statistic.save
    end
  end
end
