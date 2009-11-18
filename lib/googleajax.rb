require 'cgi'
require 'open-uri'
require 'ostruct'
require 'rubygems'
require 'json' unless defined?(Rails)

module GoogleAjax
  require 'googleajax/base' unless const_defined?("Base")
  require 'googleajax/feed'
  require 'googleajax/language'
  require 'googleajax/search'
  require 'googleajax/parser'

  API_BASE = 'http://ajax.googleapis.com/ajax/services/'
  class << self
    attr_accessor :api_key
    attr_accessor :referer

    # Api doc is at http://code.google.com/apis/ajaxsearch/documentation/reference.html#_intro_fonje
    def get(api, method, query, args = nil)
      raise "You must assign a value to GoogleAjax.referer" unless referer
      url  = "#{API_BASE}#{api}/"
      url += "#{method}?"
      url += "&q=#{CGI::escape(query)}"
      url += "&key=#{api_key}" if api_key
      url += "&" + args.collect {|key, value| "#{key}=#{value}"}.join('&') if args && !args.empty?
      data = open(url, "Referer" => referer).read
      Parser.parse(api, method, data)
    end
  end
end