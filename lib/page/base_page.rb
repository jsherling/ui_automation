require 'selenium-webdriver'
require 'selenium/webdriver/common/action_builder'
require 'selenium/webdriver/common/error'

# Selenium actions performed on elements
class BasePage
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def visit(url = '/')
    # Visit URL; ENV defined in BaseTest.rb
    puts "Navigating to #{ENV['base_url'] + url}"
    @driver.get(ENV['base_url'] + url)
  end

  def find(locator)
    @driver.find_element locator
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    puts "Unable to find element.\n\t#{e.message}"
    raise Selenium::WebDriver::Error::NoSuchElementError
  end

  def find_elements(locator)
    puts "Locator array #{locator}"
    @driver.find_elements locator
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    puts "Unable to find element.\n\t#{e.message}"
    raise Selenium::WebDriver::Error::NoSuchElementError
  end
end