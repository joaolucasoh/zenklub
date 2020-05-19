# frozen_string_literal: true

When('you click to Create a new account') do
  @zenklub.signup.create_account_redirect
end

When('do not fill in the mandatory fields') do
  @zenklub.signup.lets_signup?
end

Then('in each field there will be a mandatory alert') do
  @zenklub.signup.alerts?
end

# account create successfuly
When('fill in all the fields correctly') do
  @zenklub.signup.create_account_successfully
end

Then('I am redirected to the home page.') do
  expect(@zenklub.signup.account_created?).to be_truthy
end
