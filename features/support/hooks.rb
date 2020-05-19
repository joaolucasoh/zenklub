# fronzen_string_literal: true

require 'report_builder'
require 'capybara/cucumber'

Before do |_scenario|
  visit('/auth/login')
  @zenklub = ZenklubPages.new
end

Before('@happylogin') do
  has_text?('Que bom que você está aqui!')
  @user = { email: 'qachallenge@zenklub.com', pwd: 'qachallenge' }
  @zenklub.login.with(@user[:email], @user[:pwd])
  @zenklub.login.logged?
end

After do
  page.execute_script('localStorage.clear()')
  page.driver.quit
end

After do
  temp_shot = page.save_screenshot('log/image.png')
  screenshot = Base64.encode64(File.open(temp_shot).read)
  embed(screenshot, 'image/png', 'Screenshot')
end

at_exit do
  @infos = {
    'Client' => 'Zenklub'.upcase,
    'Test Date' => Time.now.to_s
  }

  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = 'log/report'
    config.report_types = [:html]
    config.report_title = 'Zenklub QA Engineer Challenge!'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end

After do |scenario|
  if scenario.failed?
    screenshot 'image.png'
    embed('image.png', 'image/png')
  end
end
