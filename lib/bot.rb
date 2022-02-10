require 'kybus/bot'
require_relative 'bot/core/commands'

class WisdomBot < Kybus::Bot::Base
  extend Kybus::DRY::ResourceInjector

  def user_lang
    # TODO: Take language from user setting
    'es'
  end

  def send_i18_message(msg)
    text = translate(user_lang, msg)
    send_message(text)
  end

  def translate(lang, key)
    ::WisdomBot.resource(:i18n, lang)[key]
  end

  def initialize(conf)
    super(conf)
    ::Bot::Core::Commands.register_commands(self)
  end
end
