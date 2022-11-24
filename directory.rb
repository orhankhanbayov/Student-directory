def print_header
  puts "The students of Villains Acadmey"
  puts "-------------"
end

def print_footer(names)
  puts "-------------"
  if names.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

def input_less
  var = gets.chomp
  if var.empty?
    var = "None"
  end
  var
end

def input_students
  puts "To finish at anytime, just type exit"
  students = []
  while true
    puts "Please enter the name of the student"
    name = input_less
    break if name == "exit"
    puts "Please enter cohort month"
    cohort = input_less
    break if cohort == "exit"
    puts "Please enter country of birth"
    cob = input_less
    break if cob == "exit"
    puts "Please enter height in cm"
    height = input_less
    break if height == "exit"
    students << { name: name.capitalize, cohort: cohort.capitalize.intern, cob: cob.capitalize.intern, height: height }
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  students
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def which_cohort(students)
  puts "Which cohort would you like to see?"
  user_input = gets.chomp.capitalize.intern
  puts students.map { |student| if student[:cohort] == user_input; student[:name] end }.compact
end

def interactive_menu
students = []
loop do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"

  selection = gets.chomp

  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit
  else
    puts "I don't know what you meant. try again"
  end
end
end