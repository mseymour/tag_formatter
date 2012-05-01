# encoding: utf-8
require File.expand_path('../lib/tag_formatter/version', __FILE__)

Gem::Specification.new do |s|
  s.name                  = 'tag_formatter'
  s.description           = "A simple file/string templating system."
  s.summary               = "Tag Formatter"
  s.homepage              = 'https://github.com/mseymour/tag_formatter'
  s.license               = 'MIT'
  s.authors               = ["Mark Seymour"]
  s.email                 = ['mark.seymour.ns@gmail.com']
  s.post_install_message  = "Happy tagging!"
  s.required_ruby_version = '>= 1.9.2'
  s.version               = TagFormatter::Version.to_s
  s.files                 = Dir['LICENSE', 'README.md','HISTORY.md', '{lib,test}/**/*']
end