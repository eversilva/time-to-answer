class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual attributes
  def total_questions
    self.correct_questions + self.incorrect_questions
  end
end
