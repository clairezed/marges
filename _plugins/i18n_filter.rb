# From https://github.com/gacha/gacha.id.lv/blob/master/_plugins/i18n_filter.rb

require 'i18n'

LOCALE = Jekyll.configuration({})['locale']

# Create folder "_locales" and put some locale file from https://github.com/svenfuchs/rails-i18n/tree/master/rails/locale
module Jekyll
  module I18nFilter
    # Example:
    #   {{ post.date | localize: "%d.%m.%Y" }}
    #   {{ post.date | localize: ":short" }}
    def localize(input, format=nil, locale=nil)
      load_translations
      format = (format =~ /^:(\w+)/) ? $1.to_sym : format
      I18n.locale = locale || LOCALE

      I18n.l input, :format => format
    end

    def load_translations
      if I18n.backend.send(:translations).empty?
        I18n.backend.load_translations Dir[File.join(File.dirname(__FILE__),'../_locales/*.yml')]
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::I18nFilter)
