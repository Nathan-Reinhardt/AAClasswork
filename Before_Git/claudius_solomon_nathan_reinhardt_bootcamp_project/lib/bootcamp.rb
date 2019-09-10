#Part 1
class Bootcamp
    def initialize(name,slogan,student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash,key| hash[key] = Array.new}
    end

    def name 
        @name
    end

    def slogan
        @slogan
    end

    def teachers 
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        teachers << teacher
    end

    def enroll(student)
        if students.length < @student_capacity
            students << student
            return true
        end
        false
    end
    
    def enrolled?(student)
        students.include?(student)
    end

    #Part 2

    def student_to_teacher_ratio
        students.length / teachers.length
    end

    def add_grade(student, grade)
        if students.include?(student)
            @grades[student] << grade
            return true
        end
        false
    end

    def num_grades(student)
        @grades[student].length 
    end
    
    def average_grade(student)
        if @grades[student].length == 0 || !students.include?(student)
            return nil  
        else
            sum = @grades[student].inject {|acc,el| acc + el}
            average = sum / @grades[student].length
        end
        average
    end
end

    