# frozen_string_literal: true

require 'rake/testtask'
require './lib/services'
require 'kybus/bot/migrator'

Services.configure_services!
task default: :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.warning = false
  t.pattern = 'test/**/test_*\.rb'
  t.warning = false
end


namespace :db do
  desc 'Run database migrations'
  task :migrate do
    require_relative 'lib/services'
    Services.configure_services!

    Kybus::Bot::Migrator.run_migrations!(Services.bot_database)
  end
end
