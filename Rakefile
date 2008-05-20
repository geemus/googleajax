# -*- ruby -*-

require 'rubygems'
require 'hoe'
$: << File.dirname(__FILE__) + '/lib'
require './lib/google_ajax.rb'

Hoe.new('GoogleAjax', GoogleAjax::VERSION::STRING) do |p|
  p.rubyforge_name = 'googleajax'
  p.developer('monki(Wesley Beary)', 'monki@geemus.com')
  p.summary = 'Ruby wrapper to the Google AJAX API REST interfaces(Feeds, Language and Search).'
  p.extra_deps << ['json', '>= 1.0.0']
end

# vim: syntax=Ruby