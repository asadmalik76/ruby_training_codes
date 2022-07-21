
require 'byebug'
require 'csv'
class Password
  @@no_of_alpha=0
  @@no_of_numbers=0
  @@no_of_chars=0
  def check_input(size)
    if size < 7
      puts 'Invalid input'
      exit
    end
  end
  def get_input
    puts 'Enter No of Alphabats you want '
    @@no_of_alpha = gets.chomp.to_i
    check_input(@@no_of_alpha)
    puts 'Enter No of Number you want '
    @@no_of_numbers = gets.chomp.to_i
    check_input(@@no_of_numbers)
    puts 'Enter No of symbols you want '
    @@no_of_chars = gets.chomp.to_i
    check_input(@@no_of_chars)
  end

  def generate_password
    get_input
    alphas = @@no_of_alpha.times.map { rand(65..65 + @@no_of_alpha / 2).chr }.join
    lower_alphas = @@no_of_alpha.times.map { rand(65..65 + @@no_of_alpha / 2).chr }.join
    alphas=alphas + lower_alphas.downcase
    symbols=@@no_of_chars.times.map { rand(33..33 + @@no_of_chars).chr }.join
    numbers=@@no_of_numbers.times.map { rand(0..10) }.join
    password = alphas.to_s + numbers.to_s + symbols.to_s
    password.split('').shuffle.join
    password
  end

  def check_password(password)
    contents = CSV.open('passwords.csv')
    contents.each do |row|
      return true if password == row[0]
    end
    false
  end

  def save_passwod(password)
    is_identical = check_password(password)
    unless is_identical
      CSV.open('passwords.csv', 'a+') do |csv|
        csv << [password]
        puts 'SAVED'
      end
    end
  end
end
pass=Password.new
password=pass.generate_password
pass.save_passwod(password)
