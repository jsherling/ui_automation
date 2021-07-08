# frozen_string_literal: true

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

  def clear(locator)
    puts "Clearing text field (#{locator})"
    find(locator).clear
  end

  def type(locator, input)
    puts "Sending '#{input}' to #{locator}"
    find(locator).send_keys input
  end

  def click_on(locator)
    puts "Clicking #{locator}"
    find(locator).click
  end

  def displayed?(locator)
    puts "Is displayed? #{locator}"
    rescue_exceptions { @driver.find_element(locator).displayed? }
  end

  def page_title
    page_title = @driver.title
    puts "Page title: #{page_title}"
    page_title
  end

  # Method is :value or :text and should match option attribute value
  def select_dropdown(locator, option, method = :value)
    puts "Selecting field: #{locator} \n\toption: #{option}
      select method: #{method}"
    select_list = Selenium::WebDriver::Support::Select.new(find(locator))
    select_list.select_by(method, option)
  end

  def wait_for(seconds = 30, &block)
    puts "Explicit wait up to #{seconds} seconds for..."
    Selenium::WebDriver::Wait.new(timeout: seconds).until(&block)
  end

  private

  def rescue_exceptions
    yield
  rescue Selenium::WebDriver::Error::NoSuchElementError => e
    puts "Unable to find element.\n\t#{e.message}"
    false
  rescue Selenium::WebDriver::Error::StaleElementReferenceError => e
    puts "Element is stale.\n\t#{e.message}"
    false
  end
end
