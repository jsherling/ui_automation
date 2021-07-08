# frozen_string_literal: true

require 'rake/testtask'

task default: [:test]

namespace 'selenium' do
  desc 'Run UI regression tests'
  task :test do
    FileList['test/*.rb'].each do |file|
      ruby file
    end
  end

  desc 'Run common components tests'
  task :common do
    FileList['test/user_bar_test.rb'].each do |file|
      puts "Running test file #{file}..."
      ruby file
    end
  end

  desc 'Run single test'
  task :single do
    FileList['test/footer_social_test.rb'].each do |file|
      ruby file
    end
  end

  desc 'Run static page tests'
  task :static do
    FileList['test/terms_page_test.rb'].each do |file|
      ruby file
    end
  end
end
