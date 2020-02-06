class Bootcamp

    def initialize (name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = Array.new }
    end

    #getters

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

    # actions
    def hire (teach)
        @teachers << teach
    end

    def enroll (student)
        if @students.length < @student_capacity
            @students << student
            true
        else
            false
        end
    end

    def enrolled? (student)
        @students.include? student
    end
  
    def student_to_teacher_ratio 
        @students.length / @teachers.length
    end

    def add_grade (student, grade)
        if @students.include? student
            @grades[student] << grade
            true
        else
            false
        end
    end

    def num_grades (student)
        @grades[student].length
    end

    def average_grade (student)
        if @students.include?(student) && num_grades(student) > 0
            @grades[student].sum / num_grades(student)
        else
            nil
        end
    end
end
