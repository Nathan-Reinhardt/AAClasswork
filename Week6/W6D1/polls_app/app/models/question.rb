# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  validates :body, :poll_id, presence: true

  belongs_to(
    :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
  )
  has_many(
    :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
  )
  
  # has_many(
  #   :responses,
  #   primary_key: :id,
  #   foreign_key: :question_id,
  #   class_name: :Response
  # )
end
