require 'test/unit'
require 'tag_formatter'

class TagFormatterTest < Test::Unit::TestCase
  
  def test_default_parser
    input = "\n\n{test} #inline comment\n{test}/*multiline\nblockcomment*/{test2}{test3}\n{test4}+{unknowntest}"
    expected_output = "Hello, World!\nHello, World!Test 2...Test 3\nTest 4+{unknowntest}"
    my_tags = {
      test: "Hello, World!",
      test2: "Test 2...",
      test3: "Test 3",
      test4: "Test 4",
      unusedtest5: "Unused test 5"
    }
    options = {
      tags: my_tags
    }
    assert_equal expected_output,
      TagFormatter.new(input, options).parse
  end

  def test_parser_with_options
    input = "\n\n%test% \/\/inline comment\n%test%(=multiline\nblockcomment=)%test2%%test3%\n%test4%+%unknowntest%"
    expected_output = "Hello, World!\nHello, World!Test 2...Test 3\nTest 4+%unknowntest%"
    my_tags = {
      test: "Hello, World!",
      test2: "Test 2...",
      test3: "Test 3",
      test4: "Test 4",
      unusedtest5: "Unused test 5"
    }
    options = {
      tags: my_tags,
      tag_start: '%',
      tag_end: '%',
      inline_comment_delimiter: '//',
      block_comment_start: '(=',
      block_comment_end: '=)'
    }
    assert_equal expected_output,
      TagFormatter.new(input, options).parse
  end

end