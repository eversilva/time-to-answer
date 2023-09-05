class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  def self.search(term, page, per = 10)
    Question.includes(:answers)
            .where('lower(description) LIKE ?', "%#{term.downcase}%")
            .page(page)
            .per(per)
  end
end
