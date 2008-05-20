= GoogleAjax

* Docs: http://googleajax.rubyforge.org
* Code: http://github.com/monki/google_ajax/tree/master

== DESCRIPTION:

Ruby wrapper to the Google AJAX API REST interfaces(Feeds, Language and Search).

== SYNOPSIS:

* First, setup referer: GoogleAjax.referer = 'http://mydomain.com'
* Optionally, you can also set an api_key: GoogleAjax.api_key = 'YOUR_API_KEY'
* Now you are set to go, so a few examples:
* * GoogleAjax::Feed.find('ruby') # Find top 10 feeds for 'ruby'
* * GoogleAjax::Feed.load('http://monki.geemus.com/feed/atom.xml') # Load 4 most recent entries from feed 'http://monki.geemus.com/feed/atom.xml'
* * GoogleAjax::Feed.lookup('http://monki.geemus.com') # Find feed for 'http://monki.geemus.com'
* * GoogleAjax::Language.detect('Ciao mondo') # Find the language of the string 'Ciao mondo'
* * GoogleAjax::Language.translate('Hello world', 'en', 'it') # Translate 'Hello world' to italian
* * GoogleAjax::Search.blogs('ruby') # Find top 4 blogs for 'ruby'
* * GoogleAjax::Search.books('ruby') # Find top 4 books for 'ruby'
* * GoogleAjax::Search.images('ruby') # Find top 4 images for 'ruby'
* * GoogleAjax::Search.local('ruby', 48.8565, 2.3509) # Find top 4 local results for 'ruby' at latitude 48.8565, longitude 2.3509
* * GoogleAjax::Search.news('ruby') # Find top 4 news results for 'ruby'
* * GoogleAjax::Search.video('ruby') # Find top 4 video results for 'ruby'
* * GoogleAjax::Search.web('Hello world') # Find top 4 web page results for 'Hello world'

== REQUIREMENTS:

* JSON gem to parse the responses

== INSTALL:

* sudo gem install googleajax --include-dependencies

== LICENSE:

(The MIT License)

Copyright (c) 2008 monki(Wesley Beary) => monki@geemus.com

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
