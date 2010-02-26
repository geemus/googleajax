module GoogleAjax
  class Language < Results
    def name
      LANGUAGE_NAME[self[:language]].to_s
    end

    ##
    # :call-seq:
    #   detect(query, args = {})
    # will return the language code that describes the language of the given text
    standard_api :detect
    
    # Translates the supplied text, matching the destination language.
    # source and destination can be the language code ("en") or a symbol (:english).
    # source can also be an empty string, in which case Google does an auto-detection and
    # will set :detected_source_language to the language it used as a source.
    #
    # Google limits GET request to 2000 chars, but allows POST for the translate request
    # so we use this to allow texts up to 5000 chars (another limit imposed by Google).
    #
    # TODO: Give easy way to shorten text downto the acceptable limit.
    def self.translate(query, source, destination, args = {})
      langpair = [source, destination].map{|l| LANGUAGE_CODE[l] || l.to_s}.join("|")
      args = {
        :langpair => langpair,
        :http_method => :post
      }.merge(args)
      get(:translate, query, args)
    end
    
    LANGUAGE_CODE =
    {
      :afrikaans   => "af",
      :albanian    => "sq",
      :arabic      => "ar",
      :belarusian  => "be",
      :bulgarian   => "bg",
      :catalan     => "ca",
      :chinese     => "zh-CN",
      :croatian    => "hr",
      :czech       => "cs",
      :danish      => "da",
      :dutch       => "nl",
      :english     => "en",
      :estonian    => "et",
      :filipino    => "tl",
      :finnish     => "fi",
      :french      => "fr",
      :galician    => "gl",
      :german      => "de",
      :greek       => "el",
      :hebrew      => "iw",
      :hindi       => "hi",
      :hungarian   => "hu",
      :icelandic   => "is",
      :indonesian  => "id",
      :irish       => "ga",
      :italian     => "it",
      :japanese    => "ja",
      :korean      => "ko",
      :latvian     => "lv",
      :lithuanian  => "lt",
      :macedonian  => "mk",
      :malay       => "ms",
      :maltese     => "mt",
      :norwegian   => "no",
      :persian     => "fa",
      :polish      => "pl",
      :portuguese  => "pt",
      :romanian    => "ro",
      :russian     => "ru",
      :serbian     => "sr",
      :slovak      => "sk",
      :slovenian   => "sl",
      :spanish     => "es",
      :swahili     => "sw",
      :swedish     => "sv",
      :thai        => "th",
      :turkish     => "tr",
      :ukrainian   => "uk",
      :vietnamese  => "vi",
      :welsh       => "cy",
      :yiddish     => "yi"
    }
    LANGUAGE_NAME = LANGUAGE_CODE.invert
  end
end