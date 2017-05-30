require 'base_page'

# Registration page on Demo QA site
class RegistrationPage < BasePage
  PAGE_URL = '/registration/'.freeze

  def initialize(driver, nav = true)
    super driver
    visit PAGE_URL if nav
  end
end