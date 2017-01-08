# require 'i18n'
#
# LOCALE = Jekyll.configuration({})['locale'] # set your locale from config var
#
# # Create folder "_locales" and put some locale file from https://github.com/svenfuchs/rails-i18n/tree/master/rails/locale
# module Jekyll
#   module I18nFilter
#     # Example:
#     #   {{ post.date | localize: "%d.%m.%Y" }}
#     #   {{ post.date | localize: ":short" }}
#     def localize(input, format=nil)
#       # p "1"
#       load_translations
#       # p "2"
#       format = (format =~ /^:(\w+)/) ? $1.to_sym : format
#       p format
#       p input
#       # p I18n.locale
#       p "------------------------1"
#       p Date.now
#       p "------------------------2"
#       p I18n.l('2017-01-03', :format => :default)
#       p "------------------------3"
#       p I18n.l(Date.current, format: :default)
#       p "end ------------------------"
#
#       I18n.l input, :format => format
#     rescue
#       "error"
#     end
#
#     def load_translations
#       if I18n.backend.send(:translations).empty?
#         I18n.backend.load_translations Dir[File.join(File.dirname(__FILE__),'../_locales/*.yml')]
#         I18n.locale = LOCALE
#       end
#     end
#   end
# end
#
# Liquid::Template.register_filter(Jekyll::I18nFilter)

# Taken from https://github.com/gacha/gacha.id.lv/blob/master/_plugins/i18n_filter.rb

require 'i18n'

LOCALE = Jekyll.configuration({})['locale']

# Create folder "_locales" and put some locale file from https://github.com/svenfuchs/rails-i18n/tree/master/rails/locale
module Jekyll
  module I18nFilter
    # Example:
    #   {{ post.date | localize: "%d.%m.%Y" }}
    #   {{ post.date | localize: ":short" }}
    def localize(input, format=nil, locale=nil)
      locale='fr' unless locale
      load_translations
      format = (format =~ /^:(\w+)/) ? $1.to_sym : format

      # Force the locale each time otherwise `jekyll serve` will fail with
      # "Liquid Exception: :en is not a valid locale" each time a regeneration happens
      I18n.locale = LOCALE
      # I18n.locale = locale

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
