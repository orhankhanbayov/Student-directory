def print_header
  puts "The students of Villains Acadmey".center(170)
  puts "-------------".center(170)
end

def print(students)
  counter = 0
    until counter == students.count
     if students[counter][:name][0] == "O" && students[counter][:name].length <= 12
       puts "#{counter+1}. #{students[counter][:name]} #{students[counter][:cohort]} cohort.".center(170)
     end
     counter += 1
  end
end

def print_footer(names)
  puts "-------------".center(170)
if names.count == 1
  puts "Overall, we have 1 great student".center(170)
else
  puts "Overall, we have #{names.count} great students".center(171)
end
end

def input_students
  puts "To finish at anytime, just type exit"
  students = []
  while true do 
    puts "Please enter the name of the student"
    name = gets.chomp
    break if name == "exit"
    if name.empty?
      name = "None"
    end
    puts "Please enter cohort month"
    cohort = gets.chomp
    break if cohort == "exit" 
    if cohort.empty?
      cohort = "None"
    end
    students << {name: name.capitalize, cohort: cohort.capitalize.intern} 
    if students.count == 1
      puts "Now we have 1 student"
    else
    puts "Now we have #{students.count} students"
    end
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)


#Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc

#Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. 
#To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), 
#iterate over it and only print the students from that cohort.

