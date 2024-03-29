# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment
  
  has_many :enrolled_students,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :User

  has_many :instructor,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :User

  has_many :prerequisite,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course
    
end
