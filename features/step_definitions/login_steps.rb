# frozen_string_literal: true

When('I am on the portal and enter with {string} and {string}') do |email, pwd|
  @zenklub.login.with(email, pwd)
end

Then('you should log in normally') do
  expect(@zenklub.login.logged?).to be_truthy
end

Then('should not have any session scheduled viewing this {string}') do |msg|
  @zenklub.login.not_sessions?(msg)
end
