# coding: utf-8
# @author Mark Seymour

module TagFormatter
  class Formatter
    @@_known_params = [:tags, :tag_start, :tag_end, :inline_comment_delimiter, :block_comment_start, :block_comment_end]
    attr_accessor :input
    attr_accessor *@@_known_params
    
    # Creates a new instance of TagFormatter::Formatter.
    #
    # @param [String, File] input The input; may be either a String or a File.
    # @param [Hash] params The options for parsing the String or File.
    # @option params [Hash] :tags ({}) Key+value pairs representing the tags and values associated with the tags.
    # @option params [String] :tag_start ({) The character(s) denoting the beginning of a tag.
    # @option params [String] :tag_end (}) The character(s) denoting the end of a tag.
    # @option params [String] :inline_comment_delimiter (#) The character(s) denoting an inline comment
    # @option params [String] :block_comment_start (/*) The character(s) denoting the beginning of a comment block.
    # @option params [String] :block_comment_end (*/) The character(s) denoting the end of a comment block.
    # @raise [TypeError] #input must be a String or File.
    def initialize input, params={}
      params = {
        tags: {},
        tag_start: '{',
        tag_end: '}',
        inline_comment_delimiter: '#',
        block_comment_start: '/*',
        block_comment_end: '*/'
      }.merge(params)
      
      # Assigning input to @input if string
      @input = if input.is_a? String
        input
      # Reading input and assigning the resultant string to @input
      elsif input.is_a? File
        input.read.to_s
      # Raise a TypeError.
      else
        raise TypeError, "input was an `#{input.class.name}', expected a `String' or `File'."
      end
      # Assign the param values to the (known) attributes.
      @@_known_params.each do |attr|
        self.send(attr.to_s + "=", params[attr])
      end
    end

    # Parses the supplied input and returned a decommented, tagified and cleaned string.
    #
    # @return A string with the parsed input.
    def parse
      tagify(decommentify(@input)).strip
    end

    private

    # Decommentifies the supplied input.
    #
    # @param [String] input The string to decommentify.
    # @return A string with the decommented input.
    def decommentify input
      output = input.dup
      # Remove multiline comments:
      output.gsub!(/(#{Regexp.quote @block_comment_start}.+?#{Regexp.quote @block_comment_end})/m, "")
      # Remove inline comments:
      output.gsub!(/(#{Regexp.quote @inline_comment_delimiter}.+$)/,"")
      return output.lines.map(&:strip).join($/)
    end

    # Tagifies the supplied input.
    #
    # @param [String] input The string to tagify.
    # @raise [StandardError] @tags must not be empty.
    # @return A string with the tags replaced with their values.
    def tagify input
      output = input.dup
      raise StandardError, "@tags is empty!" if @tags.empty? #improve on this
      @tags.each {|key,value| output.gsub!(tag_start.to_s+key.to_s+tag_end.to_s, value.to_s)}
      return output
    end
  end
end