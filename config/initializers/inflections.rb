# encoding: utf-8
# Be sure to restart your server when you modify this file.


# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.plural /^(.*)o$/i, '\1i'
   inflect.singular /^(.*)i$/i, '\1o'
   inflect.plural /^(.*)a$/i, '\1e'
   inflect.singular /^(.*)e$/i, '\1a'
   inflect.irregular 'causale', 'causali'
   inflect.uncountable %w( unita )
 end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
