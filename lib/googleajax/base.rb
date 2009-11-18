module GoogleAjax
  class Base < OpenStruct
    def [](key)
      send(key)
    end

    def []=(key, value)
      send("#{key}=", value)
    end

    def self.remap(h)
      define_method(:initialize) do |arg|
        super(arg)
        h.each do |key, klass|
          case self[key]
          when Array
            self[key] = self[key].map(&klass.method(:new))
          when Hash
            self[key] = klass.new(self[key])
          end
        end
      end
    end
  end
end