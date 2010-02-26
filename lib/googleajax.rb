require 'net/http'
require 'cgi'
require 'json' unless defined?(Rails)

# The following extensions are standard in either Ruby 1.8.7, 1.9 or rails:
require 'googleajax/extensions/kernel'
require 'googleajax/extensions/string'
require 'googleajax/extensions/hash'

# GoogleAjax lib:
require 'googleajax/hash'
require 'googleajax/filters'
require 'googleajax/api'
require 'googleajax/request'
require 'googleajax/base' unless GoogleAjax.const_defined?("Base")
require 'googleajax/results'
require 'googleajax/feed'
require 'googleajax/language'
require 'googleajax/search'

# Final touch
GoogleAjax.extend GoogleAjax::Request
