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

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def input_students
puts "Please enter the name of the students"
puts "To finish, just hit return twice"
students = []
name = gets.chomp
while !name.empty? do 
  students << {name: name, cohort: :november} 
  puts "Now we have #{students.count} students"
  name = gets.chomp
end
students
end

students = input_students
print_header
print(students)
print_footer(students)