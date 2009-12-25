= GoogleAjax

* Docs: http://googleajax.rubyforge.org
* Code: http://github.com/geemus/googleajax

== DESCRIPTION:

Ruby wrapper for Google AJAX API REST interfaces(Feeds, Language and Search).

== SYNOPSIS:

  require "googleajax"

  # First, setup referer: 
  GoogleAjax.referer = [your domain name here]

  # Optionally, you can set an api_key:
  GoogleAjax.api_key = [your api key here]

=== Now you are set to go, so here are a few examples:

  # Find top 10 feeds for 'ruby'
  GoogleAjax::Feed.find('ruby')

  # Load 4 most recent entries from 'http://monki.geemus.com/feed/atom.xml'
  GoogleAjax::Feed.load('http://monki.geemus.com/feed/atom.xml')

  # Find feed for 'http://monki.geemus.com'
  GoogleAjax::Feed.lookup('http://monki.geemus.com')

  # Find the language of the string 'Ciao mondo'
  GoogleAjax::Language.detect('Ciao mondo')

  # Translate 'Hello world' to italian
  GoogleAjax::Language.translate('Hello world', 'en', 'it')

  # Find top 4 blogs for 'ruby'
  GoogleAjax::Search.blogs('ruby')

  # Find top 4 books for 'ruby'
  GoogleAjax::Search.books('ruby')

  # Find top 4 images for 'ruby'
  GoogleAjax::Search.images('ruby')

  # Find top 4 local results for 'ruby' at latitude 48.8565, longitude 2.3509
  GoogleAjax::Search.local('ruby', 48.8565, 2.3509)

  # Find top 4 news results for 'ruby'
  GoogleAjax::Search.news('ruby')

  # Find top 4 video results for 'ruby'
  GoogleAjax::Search.video('ruby')

  # Find top 4 web page results for 'Hello world'
  GoogleAjax::Search.web('Hello world')

  # Find top 10 feeds for 'ruby'
  GoogleAjax::Feed.find('ruby')



=== Results

Results from the methods are hashes, automatically converted from the response from Google.

For example:

  # Find top 4 web page results for 'Hello world'
  GoogleAjax::Search.web('Hello world')
  # => { :results=>[
  #       { :title=>"<b>Hello world</b> program - Wikipedia, the free encyclopedia",
  #         # ... more data ...
  #         :url=>"http://en.wikipedia.org/wiki/Hello_world_program"
  #       },
  #       # ... more results
  #     ],
  #     :cursor=>{
  #       :current_page_index=>0,
  #       # ... more data ...
  #       :estimated_result_count=>57800000
  #     }
  #   }

When possible, the result is simplified:
* Feed.find will return an array instead of {:entries => array}
* Feed.load will return the feed instead of {:feed => feed}

== REQUIREMENTS:

* JSON gem to parse responses, or rails

== INSTALL:

  sudo gem install googleajax

== LICENSE:

(The MIT License)

Copyright (c) 2009 {geemus (Wesley Beary)}[http://github.com/geemus]
and {Marc-Andre Lafortune}[http://github.com/marcandre]

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
