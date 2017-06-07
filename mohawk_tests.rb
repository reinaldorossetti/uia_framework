require 'mohawk'

class LoginScreen
  include Mohawk
  window(:title => /HP/)
  text(:username, :id => "agentName")
  text(:password, :id => "password")
  button(:login, :name => "OK")
end


def login
  test = LoginScreen.new
  test.username.clear
  test.username = "john"
  test.password = "HP"
  test.login
end

login
