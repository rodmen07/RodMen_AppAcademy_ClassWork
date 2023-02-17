class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @grades = Hash.new { |hash, key| hash[key] = [] }
        @teachers = []
        @students = []
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

    def grades
       @grades
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio()
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            return true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].count
    end

    def average_grade(student)
        @grades[student].count > 0 ? @grades[student].sum / @grades[student].count : nil
    end
end
