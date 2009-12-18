class Hash
  # From the 'backports' gem
  # New Ruby 1.8.7+ constructor -- not documented, see redmine # 1385
  # <tt>Hash[[[:foo, :bar],[:hello, "world"]]] ==> {:foo => :bar, :hello => "world"}</tt>
  class << self
    alias_method :original_constructor, :[]
    def [](*args)
      return original_constructor(*args) unless args.length == 1 && args.first.is_a?(Array)
      h = {}
      args.first.each do |arr|
        next unless arr.respond_to? :to_ary
        arr = arr.to_ary
        next unless (1..2).include? arr.size
        h[arr.at(0)] = arr.at(1)
      end
      h
    end unless (Hash[[[:test, :test]]] rescue false)
  end
end