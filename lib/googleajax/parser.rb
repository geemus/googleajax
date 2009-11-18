module GoogleAjax
  module Parser
    def self.parse(api, method, data)
      data = if defined? Rails
        ActiveSupport::JSON::decode(data)
      else
        JSON.parse(data)
      end
      process_errors(data)
      parser = PARSERS[api][method]
      response = data['responseData']
      parser.is_a?(Symbol) ? send(parser, response) : parser.new(response) if response
    end

    def self.process_errors(data)
      status = data['responseStatus']
      unless (200..206).include? status
        raise StandardError, data['responseDetails']
      end
    end

    def self.parse_feed_list(data)
      data['entries'].map(&Feed::Feed.method(:new))
    end

    def self.parse_one_feed(data)
      Feed::Feed.new(data['feed'])
    end

    PARSERS = {
      :feed     => { :find => :parse_feed_list, :load => :parse_one_feed, :lookup => Feed::Feed },
      :language => { :detect => Language::Language, :translate => Language::Translation },
      :search   => { :blogs => Search::Results, :books => Search::Results, :images => Search::Results, :local => Search::Results,
                     :news => Search::Results, :video => Search::Results, :web => Search::Results }
    }

  end
end