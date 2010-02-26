module GoogleAjax
  # The API module provides generic methods to call the Google API
  # These are specialized in the different APIs (Language, Search & Feed)
  module API

    # All APIs have a default version of 1.0 (override otherwise)
    def version
      1.0
    end

    # All APIs have, by default version a kind corresponding to their name (e.g. "language")
    def kind
      @kind ||= name.demodulize.downcase.to_sym
    end

    # Sends the request to google and converts it to Ruby
    # A block can be passed to alter the received hash
    def get(method, query, args = {})
      args = { :v => version }.merge(args)
      response = GoogleAjax::get(kind, method, query, args)
      data = extract_data(
        parse(response)
      )
      data = yield data if block_given?
      # Convert hashes to an instance of ourself from this data:
      Filters::Recursive.remap(data, self)
    end

    LOOKS_LIKE_HTML = /\w*<html>/i
    def parse(data)
      if data =~ LOOKS_LIKE_HTML
        raise StandardError, /<title>(.*)<\/title>/.match(data)[1]
      end
      if defined? Rails
        ActiveSupport::JSON::decode(data)
      else
        JSON.parse(data)
      end
    end

    # verifies the responses' status and either raises an error
    # or else returns the response data.
    def extract_data(hash)
      status = hash['responseStatus']
      unless (200..206).include? status
        raise StandardError, hash['responseDetails'] || "Wrong status code (#{status.inspect})"
      end
      hash['responseData']
    end

    # Since most api have the same form, this helper can create these calls easily.
    # If a block is given, it will be passed to #get
    def standard_api(*methods, &block)
      methods.each do |method|
        define_singleton_method(method) do |*args|
          get(method, *args, &block)
        end
      end
    end
  end
end
