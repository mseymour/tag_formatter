require 'tag_formatter/formatter.rb'

module TagFormatter
  class << self
    # Alias for TagFormatter::Formatter.new
    #
    # @return [TagFormatter::Formatter]
    def new(input, params={})
      TagFormatter::Formatter.new(input, params)
    end

    # Delegate to TagFormatter::Formatter
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end