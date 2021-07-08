# frozen_string_literal: true

require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/reporters'

# Base class for UI tests.
class BaseTest < Minitest::Test
  Minitest::Reporters.use! unless ENV['RM_INFO']
  # TODO: Review next line
  # [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]

  # TODO: review
  # @driver = Selenium::WebDriver.for :chrome,
  # desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
  #   'chromeOptions' => {
  #     'args' => %w[--disable-infobars --disable-web-security]
  #   }
  # )

  BROWSER = :chrome
  CAPS = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      'args' => %w[--disable-infobars --disable-web-security]
    }
  )

  # Test environments
  GITHUB = 'https://jsherling.github.io'
  THE_INTERNET = 'https://the-internet.herokuapp.com'
  ENV['base_url'] = THE_INTERNET
end
