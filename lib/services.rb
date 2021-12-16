# frozen_string_literal: true

require 'kybus/bot'
require 'kybus/configs'
require 'sequel'
require 'telegram/bot'

require_relative 'bot.rb'

module Services
  class << self
    attr_reader :conf, :conf_manager, :services

    def configure_services!
      Dir.mkdir('storage') unless Dir.exist?('storage')
      @conf_manager = Kybus::Configuration.auto_load!
      @conf = @conf_manager.configs
      @services = @conf_manager.all_services
      load_i18n!
    end

    def load_i18n!
      Dir['i18n/*.yml'].each do |file_name|
        lang = file_name.sub('i18n/', '').sub('.yml', '')
        keys = YAML.load_file(file_name)
        WisdomBot.register(:i18n, lang, keys)
      end
    end

    def bot
      @bot ||= WisdomBot.new(Services.conf['bots']['main'])
    end

    def bot_database
      @bot_database ||= Sequel.connect(Services.conf['bots']['main']['state_repository']['endpoint'])
    end
  end
end
