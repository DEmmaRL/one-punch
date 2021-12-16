module Bot
  module Core
    module Commands
      def self.register_commands(bot)
        bot.register_command('/start') do
          send_i18_message('hello')
        end

        bot.register_command('/help') do
          send_i18_message('help_command')
        end

        bot.register_command('default') do
          send_i18_message('help')
        end
      end
    end
  end
end
