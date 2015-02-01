require 'digest'

class Gravatar

  attr_accessor :email, :size

  def initialize(email, size)
    self.email = email.to_s 
    self.size = size.to_i 
  end


  def run
    puts "Running application ..."
    check_input
    puts "Your email is: #{ @email }"
    puts "You chose size: #{ @size }x#{ @size } px"
    puts "\nYour gravatr URL is: #{ url } " 
  end


  private


  # return url
  def url
    make_url(coding, @size)
  end


  # return crypted email
  def coding
    code_email(@email)
  end


  # return email
  def make_url(md5_mail, size)
    "http://www.gravatar.com/avatar/#{ md5_mail }\?s=#{ size }"
  end

  
  # crypting email
  def code_email(source) 
    Digest::MD5.hexdigest @email
  end


  def check_input
    if ARGV.empty?
      puts "Incorect input - please add email and size like below:\nruby gravatar.rb your_email avatar_size"
      exit
    end
  end
end

g = Gravatar.new(ARGV[0], ARGV[1])
g.run
