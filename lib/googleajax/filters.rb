module GoogleAjax
  # The Result classes are initialized with a hash.
  # Filters can be included to modify this hash.
  module Filters

    # The Recursive filter converts all Hash values to GoogleAjax::Base (recursively)
    # This will also make any other filters included in GoogleAjax::Base be called
    module Recursive
      
      # A utility method to inspect value and convert Hash to base_klass, even when inside arrays
      def self.remap(value, base_klass = Base)
        case value
        when ::Hash
          base_klass.new(value)
        when Array
          value.map{|e| remap(e)}
        else
          value
        end
      end

      def initialize(h)
        h.each{|key, value| h[key] = Recursive.remap(value)}
        super(h)
      end
    end

    # The SymbolizeKeys filter converts the Javascript style keys ("someKey")
    # to ruby-style keys (:some_key)
    module SymbolizeKeys
      def initialize(h)
        h= ::Hash[
          h.map do |key, value|
            [key.underscore.to_sym, value]
          end
        ]
        super(h)
      end
    end

    # The ConvertValues filter converts the string values
    # to ruby-style values (e.g. Integers, Floats, true, false or Strings)
    module ConvertValues
      TRUE_OR_FALSE = /^true|(false)$/i
      INTEGER = /^\d+$/
      FLOAT = /^\d+\.\d+$/
      TIME = /^[A-Z][a-z]{2}, \d\d [A-Z][a-z]{2} \d{4} \d\d:\d\d:\d\d \S*$/  # Very strict date format
      def initialize(h)
        h.each do |key, value|
          # Won't use Integer.try_convert for 1.8.6 & 7 compatibility
          case value
          when INTEGER
            h[key] = value.to_i
          when FLOAT
            h[key] = value.to_f
          when TRUE_OR_FALSE
            h[key] = Regexp.last_match[1].nil?
          when TIME
            require 'time'
            h[key] = Time.parse(value)
          end
        end
        super(h)
      end
    end

    # By default, all filters are applied
    module Default
      include ConvertValues
      include SymbolizeKeys
      include Recursive
    end
  end
end