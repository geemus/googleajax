require 'cgi'
require 'open-uri'
require 'ostruct'
require 'rubygems'
require 'json'

require 'google_ajax/feed'
require 'google_ajax/language'
require 'google_ajax/parser'
require 'google_ajax/search'
require 'google_ajax/version'

class GoogleAjax
  API_BASE = 'http://ajax.googleapis.com/ajax/services/'
  @@api_key = @@referer = nil
  
  def self.api_key
    @@api_key
  end
  def self.api_key=(key)
    @@api_key = key
  end
  def self.referer
    @@referer
  end
  def self.referer=(referer)
    @@referer = referer
  end

  def self.get(api, method, query, args = nil)
    raise "You must assign a value to GoogleAjax.referer" unless @@referer
    url  = "#{API_BASE}#{api}/"
    url += "#{method}?"
    url += "&q=#{CGI::escape(query)}"
    url += "&key=#{api_key}" if @@api_key
    url += "&" + args.collect {|key, value| "#{key}=#{value}"}.join('&') if args && !args.empty?
    data = open(url, "Referer" => @@referer).read
    Parser.parse(api, method, data)
  end  
end