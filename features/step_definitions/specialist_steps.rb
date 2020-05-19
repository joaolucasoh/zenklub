# frozen_string_literal: true

When('you click on the tab our specialists.') do
  @zenklub.specialist.goto
end

When('click on the first professional on the list.') do
  @zenklub.specialist.choose_specialist
end

Then('I must go to your page and see more information about specialist') do
  expect(@zenklub.specialist.spec_page?).to be_truthy
end
