# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Enrollment

  belongs_to :enrolled_courses,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

  end
