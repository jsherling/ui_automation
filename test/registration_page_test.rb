$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require 'registration_page'

# Test Demo QA Registration page
class DemoQaRegistrationTest < BaseTest
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @demo = RegistrationPage.new @driver
  end

  def teardown
    @driver.quit
  end

  def test_one

  end
end