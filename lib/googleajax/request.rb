module GoogleAjax
  module Request
    API_BASE = 'http://ajax.googleapis.com/ajax/services/'

    attr_accessor :api_key
    attr_accessor :referer
    alias_method :referrer, :referer  # See mispelling section in http://en.wikipedia.org/wiki/HTTP_referrer
    alias_method :referrer=, :referer=

    # Api doc is at http://code.google.com/apis/ajaxsearch/documentation/reference.html#_intro_fonje
    def get(api, method, query, args = nil)
      raise "You must assign a value to GoogleAjax.referer" unless referer
      url  = "#{API_BASE}#{api}/"
      url += "#{method}?"
      url += "&q=#{CGI::escape(query)}"
      url += "&key=#{api_key}" if api_key
      url += "&" + args.collect {|key, value| "#{key}=#{value}"}.join('&') unless args.nil? || args.empty?
      open(url, "Referer" => referer).read
    end
  end
end