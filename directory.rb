@students = []
def print_header
  puts "The students of Villains Acadmey"
  puts "-------------"
end

def print_footer
  puts "-------------"
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end


def input_less
  var = gets.chomp
  if var.empty?
    var = "None"    
  end
  var
end

def student_count_update
  if @students.count == 1
    puts "Now we have 1 student"
  else
    puts "Now we have #{@students.count} students"
  end
  end

def input_students
  puts "To finish at anytime, type exit"
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
    @students << { name: name.capitalize, cohort: cohort.capitalize.intern, cob: cob.capitalize.intern }
    student_count_update
  end
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
  input_students
  when "2"
   show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant. try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:cob]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def load_students
file = File.open("students.csv", "r")
file.readlines.each do |line|
  name, cohort, cob = line.chomp.split(',')
    @students << {name: name, cohort: cohort.intern, cob: cob.intern}
end
file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
  end