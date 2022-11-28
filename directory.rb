@students = []

def print_header
  puts "The students of Villains Acadmey"
  puts "-------------"
end

def print_footer
  puts "-------------"
  student_counter
  puts ""
end

def insert_to_hash(name, cohort, cob)
  @students << {
    name: name.capitalize,
    cohort: cohort.capitalize.intern,
    cob: cob.capitalize.intern,
  }
end

def input_less
  var = STDIN.gets.chomp
  if var.empty?
    var = "None"
  end
  var
end

def student_counter
  if @students.count == 1
    puts "Overall, we have 1 student."
  else
    puts "Overall, we have #{@students.count} students."
  end
end

def input_students
  system("clear")
  puts "You have succesfully selected student input."
  puts "-------------"
  while true
    puts "To finish at anytime, type exit."
    puts "Please enter the name of the student"
    name = input_less
    break if name == "exit"
    puts "Please enter cohort month"
    cohort = input_less
    break if cohort == "exit"
    puts "Please enter country of birth"
    cob = input_less
    break if cob == "exit"
    insert_to_hash(name, cohort, cob)
    student_counter
    system("clear")
  end
end

def print_students_list
  @students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_menu
  puts "-------------"
  puts "1. Input students"
  puts "2. Show students"
  puts "3. Show by cohort"
  puts "4. Save list"
  puts "5. Load list"
  puts "6. Show hash"
  puts "9. Exit"
end

def show_students
  system("clear")
  puts "You have sucessfuly selected show students."
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
    which_cohort
  when "4"
    save_students
  when "5"
    load_students_inmenu
  when "6"
    show_hash
  when "9"
    exit
  else
    puts "I don't know what you meant. try again"
  end
end

def which_cohort
  system("clear")
  puts "Which cohort would you like to view?"
  user_input = STDIN.gets.chomp.capitalize.intern
  puts "-------------"
  puts @students.map { |student| if student[:cohort] == user_input; student[:name] end }.compact
end

def load_students_inmenu
  system("clear")
  puts "What is the name of the file you would like to load? (leave blank for default students.csv)"
  gname = STDIN.gets.chomp
  if gname.empty?
    load_students
  else
    load_students(gname + ".csv")
  end
end

def save_students
  system("clear")
  puts "What would you like to save the file as? Hit enter for default students.csv"
  fname = STDIN.gets.chomp + ".csv"
  if fname == ".csv"
    fname = "students.csv"
  end
  file = File.open(fname, "w")
  @students.each { |student| file.puts [student[:name], student[:cohort], student[:cob]].join(",") }
  file.close
end

def load_students(filename = "students.csv")
  @students.clear
  if !File.exist?(filename)
    file = File.new("students.csv", "w")
    file.close
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, cob = line.chomp.split(",")
    insert_to_hash(name, cohort, cob)
  end
  file.close
end

def cline_load_students
  filename = ARGV.first
  if filename == nil
    load_students
    puts "Default loaded #{@students.count} from student.csv"
  elsif File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
  system("clear")
end

def directoryprogram
  system("clear")
  cline_load_students
  interactive_menu
end

def show_hash
  puts @students
end

directoryprogram
