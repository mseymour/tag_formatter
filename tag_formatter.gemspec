# encoding: utf-8
require File.expand_path('../lib/tag_formatter/version', __FILE__)

Gem::Specification.new do |s|
  s.name                  = 'tag_formatter'
  s.description           = "A simple file/string tag parser."
  s.summary               = "Tag Formatter"
  s.homepage              = 'https://github.com/mseymour/Tag-Formatter'
  s.license               = 'MIT'
  s.authors               = ["Mark Seymour"]
  s.email                 = ['mark.seymour.ns@gmail.com']
  s.post_install_message  = "Happy tagging!"
  s.required_ruby_version = '>= 1.9.2'
  s.version               = TagFormatter::Version.to_s
end