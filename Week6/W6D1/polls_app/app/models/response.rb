# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  question_id      :integer          not null
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :question_id, :user_id, :answer_choice_id, presence: true

  belongs_to(
    :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
  )

  belongs_to(
    :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  )

end
