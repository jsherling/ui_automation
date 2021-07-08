# frozen_string_literal: true

require 'base_page'

# Registration page on Demo QA site
class RegistrationPage < BasePage
  PAGE_URL = '/registration/'

  def initialize(*args)
    super args[0]
    visit PAGE_URL if args.count == 1
  end
end
