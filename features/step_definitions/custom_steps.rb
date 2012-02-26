Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one admin user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am logged in as an admin$/ do
  email    = 'testing@domain.com'
  login    = 'Testing'
  password = 'secretpass'

  Given %{I have one admin user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end
