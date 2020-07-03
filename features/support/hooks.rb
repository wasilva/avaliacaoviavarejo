require "selenium-webdriver"

Before do |scn|
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.quit
  Capybara.default_wait_time = 15
  @scn_name = "#{scn.name + Time.now.strftime("%H-%M-%S")}"
end

AfterStep do |step|
  data = "#{Time.now.strftime("%Y/%B/%d")}"
  hora = "#{Time.now.strftime("%H-%M-%S")}"
  save_screenshot("data/screenshots/#{@scn_name}/#{data}-#{hora}.png")
end

AfterStep do |step|
  if step.failed?
    data = "#{Time.now.strftime("%Y/%B/%d")}"
    hora = "#{Time.now.strftime("%H-%M-%S")}"
    save_screenshot("data/failed/#{@scn_name}/#{data}-#{hora}.png")
  end
end

#  After do |step|
#    if step.failed?
#      binding.pry
#    end
#  end
