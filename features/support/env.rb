require 'psych'
require 'yaml'
require 'rspec'
require "capybara/cucumber"
require "pry"
require "yaml"
# require "capybara/poltergeist"
require "ffaker"
require "rake"
require "selenium/webdriver"
require "net/http"
# require "rest-client"
require "date"
require "base64"

require_relative "page_object"
World(PageObjects)

DATA = YAML.load_file("data/data_user.yml")
DATASKU = YAML.load_file("data/data_sku.yml")
URLMS = YAML.load_file("data/msiteurl.yml")
EL = YAML.load_file("data/elements.yml")
MSG = YAML.load_file("data/msg.yml")
ELDIF = YAML.load_file("data/elements_ponto_frio.yml")

if ENV["extra"]
  $site = "extra"
elsif ENV["ponto_frio"]
  $site = "ponto_frio"
elsif ENV["casas_bahia"]
  $site = "casas_bahia"
else
  $site = "casas_bahia"
end

if ENV["chrome"]
  # Capybara.default_driver = :chrome
  # caps = Selenium::WebDriver::Remote::Capabilities.chrome
  # caps['pageLoadStrategy'] = 'none'
  # Capybara.register_driver :chrome do |app|
  #   Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)

  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   switches: ["disable-web-security"])
  end
elsif ENV["chrome_headless"]
  Capybara.default_driver = :chrome_headless
  Capybara.register_driver :chrome_headless do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   switches: ["--incognito",
                                              "--headless",
                                              "disable-gpu",
                                              "window-size=360,640"])
  end
elsif ENV["iphone"]
  iphone6 = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    caps["pageLoadStrategy"] = "none"
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   port: 4442,
                                   desired_capabilities: caps,
                                   switches: ["--window-size=360,640",
                                              "--user-agent='#{iphone6}'"])
  end
else ENV["remote"]
  iphone6 = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities["browserName"] = "chrome"
  capabilities["version"] = ""
  capabilities["platform"] = "Windows"
  capabilities["window-size"] = "360,640"
  capabilities["user.agent"] = iphone6
  Capybara.register_driver :selenium do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 1200 #seconds

  Capybara::Selenium::Driver.new(app, http_client: client,
                                      :browser => :remote,
                                      :url => "http://10.128.132.161:4381/wd/hub/",
                                      :desired_capabilities => capabilities)
end
  Capybara.server_port = 8888 + ENV["TEST_ENV_NUMBER"].to_i
  Capybara.default_driver = :selenium
  Capybara.run_server = false end
