module GoogleAjax
  module Language
    LANGUAGE_VERSION = 1.0
    def self.get(method, query, args)
      args = { :v => LANGUAGE_VERSION }.merge(args)
      GoogleAjax::get(:language, method, query, args)
    end
    
    # will return the language code that describes the language of the given text
    def self.detect(query, args = {})
      self.get(:detect, query, args)
    end
    
    # will return translated text for the given text supplied, matching the destination language.
    def self.translate(query, source, destination, args = {})
      args = { :langpair => "#{source}%7C#{destination}"}.merge(args)
      self.get(:translate, query, args)
    end
    
    class Language < Base
      def name
        (@@lang_cache ||= LANGUAGES.invert)[self.language]
      end
    end
    
    class Translation < Base
    end
    
    LANGUAGES =
    {
      'ARABIC' => 'ar',
      'BULGARIAN' => 'bg',
      'CATALAN' => 'ca',
      'CHINESE' => 'zh',
      'CHINESE_SIMPLIFIED' => 'zh-CN',
      'CHINESE_TRADITIONAL' => 'zh-TW',
      'CROATIAN' => 'hr',
      'CZECH' => 'cs',
      'DANISH' => 'da',
      'DUTCH'=> 'nl',
      'ENGLISH' => 'en',
      'ESTONIAN' => 'et',
      'FILIPINO' => 'tl',
      'FINISH' => 'fi',
      'FRENCH' => 'fr',
      'GERMAN' => 'de',
      'GREK' => 'el',
      'HEBREW' => 'iw',
      'HINDI' => 'hi',
      'HUNGARIAN' => 'hu',
      'INDONESIAN' => 'id',
      'ITALIAN' => 'it',
      'JAPANESE' => 'ja',
      'KOREAN' => 'ko',
      'LATVIAN' => 'lv',
      'LITHUANIAN' => 'lt',
      'NORWEGIAN' => 'no',
      'PERSIAN' => 'fa',
      'POLISH' => 'pl',
      'PORTUGUESE' => 'pt-PT',
      'ROMANIAN' => 'ro',
      'RUSIAN' => 'ru',
      'SERBIAN' => 'sr',
      'SLOVAK' => 'sk',
      'SLOVENIAN' => 'sl',
      'SPANISH' => 'es',
      'SWEDISH' => 'sv',
      'THAI' => 'th',
      'TURKISH' => 'tr',
      'UKRAINIAN' => 'uk',
      'VIETNAMESE' => 'vi',
      'UNKNOWN' => ''
    }
  end
end