class GoogleAjax
  class Parser
    def self.parse(api, method, data)
      if defined? Rails
        data = ActiveSupport::JSON::decode(data) 
      else
        data = JSON.parse(data) 
      end
      Errors.process(data)
      parser = Parser::PARSERS[api][method]
      parser.process(data['responseData'])
    end
  end
  
  class FeedFind < Parser#:nodoc:
    def self.process(data)
      data['entries'].collect {|data| GoogleAjax::Feed::Feed.new(data)} if data
    end
  end
  class FeedLoad < Parser#:nodoc:
    def self.process(data)
      GoogleAjax::Feed::Feed.new(data['feed']) if data
    end
  end
  class FeedLookup < Parser#:nodoc:
    def self.process(data)
      GoogleAjax::Feed::Feed.new(data) if data
    end
  end
  
  class LanguageDetect < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Language::Language.new(data) if data
    end
  end
  class LanguageTranslate < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Language::Translation.new(data) if data
    end
  end
  
  class SearchBlogs < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end
  class SearchBooks < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end
  class SearchImages < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end  
  class SearchLocal < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end
  class SearchNews < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end  
  class SearchVideo < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end
  class SearchWeb < Parser#:nodoc
    def self.process(data)
      GoogleAjax::Search::Results.new(data) if data
    end
  end
  
  class Parser
    PARSERS = {
      :feed     => { :find => FeedFind, :load => FeedLoad, :lookup => FeedLookup },
      :language => { :detect => LanguageDetect, :translate => LanguageTranslate, },
      :search   => { :blogs => SearchBlogs, :books => SearchBooks, :images => SearchImages, :local => SearchLocal, :news => SearchNews, :video => SearchVideo, :web => SearchWeb }
    }
  end
  
  class Errors
    def self.process(data)
      status = data['responseStatus']
      unless [200, 201, 202, 203, 204, 205, 206].include? status
        raise StandardError.new(data['responseDetails'])
      end
    end
  end
end