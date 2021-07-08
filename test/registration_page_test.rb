# frozen_string_literal: true

$LOAD_PATH.push 'lib/page'
require_relative 'base_test'
require '../lib/page/registration_page'

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
    # TODO: create a real test
    assert_match true, true
  end
end
