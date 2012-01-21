Tag Formatter
=============
**Tag Formatter** (for a lack of a better name) is—of course—a Ruby gem that takes in text input with "tags", and replaces those tags with text as defined by the programmer.

Installation
------------
Currently, as of 2012-01-21 at 6:00 PM AST, the gem is not in the RubyGems repository. You can however clone the repository and then build+install the gem like so:

    git clone git@github.com:mseymour/Tag-Formatter.git
    gem build tag_formatter/tag_formatter.gemspec
    gem install --local tag_formatter/tag_formatter-0.0.1.pre-1.gem

Usage
-----
Valid option symbols for configuring an instance of `TagFormatter`:

* `tags` (`Hash`)
* `tag_start` (`String`)
* `tag_end` (`String`)
* `inline_comment_delimiter` (`String`)
* `block_comment_start` (`String`)
* `block_comment_end` (`String`)

Formatting a block of text using the default options:

    text = <<-HEREDOC
    Hello, I am {firstname} {lastname}.
    I like {something}. #Something can be anything.
    /*I do not know about you,
    but block comments are pretty rad.*/
    HEREDOC
    
    tf = TagFormatter.new text, tags: {firstname: "Mark", lastname: "Seymour", something: "listening to music"}
    
    puts tf.parse! #=> Hello, I am Mark Seymour.\nI like listening to music.

Formatting a block of text using user-supplied options:

    tf = TagFormatter.new "I like to %verb% it, %verb% it!", tags: {verb: "move"}, tag_start: '%', tag_end: '%'
    puts tf.parse! #=> I like to move it, move it!

Contribute
----------
Any and all issues should be reported via the Issues tab in Github.

Fixes, additions, patches, etc. are greatly welcome.

Author information
------------------
* Mark Seymour ('Azure')
* Email: mark.seymour.ns@gmail.com
* WWW: http://lain.rustedlogic.net/
* IRC: #shakesoda @ irc.freenode.net