
require 'byebug'
require 'csv'
def check_input(n)
  if n < 7
    puts 'Invalid input'
    exit
  end
end

def generate_alpha
  puts 'Enter No of Alphabats you want '
  size = gets.chomp.to_i
  check_input(size)
  alphas = size.times.map { rand(65..65 + size / 2).chr }.join
  lower_alphas = size.times.map { rand(65..65 + size / 2).chr }.join
  alphas + lower_alphas.downcase
end

def generate_numbers
  puts 'Enter No of Number you want '
  size = gets.chomp.to_i
  check_input(size)
  size.times.map { rand(0..10) }.join
end

def generate_symbols
  puts 'Enter No of symbols you want '
  size = gets.chomp.to_i
  check_input(size)
  size.times.map { rand(33..33 + size).chr }.join
end

def generate_password
  alpha = generate_alpha
  numbers = generate_numbers
  symbols = generate_symbols
  password = alpha.to_s + numbers.to_s + symbols.to_s
  password.split('').shuffle.join
end

def check_password(password)
  contents = CSV.open('passwords.csv')
  contents.each do |row|
    return true if password == row[0]
  end
  false
end

def save_passwod
  password = generate_password
  is_identical = check_password(password)
  unless is_identical
    CSV.open('passwords.csv', 'a+') do |csv|
      csv << [password]
      puts 'SAVED'
    end
  end
end
save_passwod
