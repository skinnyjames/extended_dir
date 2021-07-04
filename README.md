# extended_dir

[![Build Status](http://drone.skinnyjames.net/api/badges/skinnyjames/extended_dir/status.svg)](http://drone.skinnyjames.net/skinnyjames/extended_dir)

library for prioritizing files in a directory according to load order

## installation

in your Gemfile

`gem "extended_dir"`

## usage

let's say one has a collection of files in a directory that depend on each other

```ruby
  # /lib/core/base.rb
  module Core
    class Base;
      # /lib/extra/mixin.rb
      include Extra::Mixin
    end
  end
```
```ruby
  # /lib/a.rb
  class A < Core::Base; end
```
```ruby
  #/lib/b.rb
  class B < Core::Base; end
```
```ruby
  # /script.rb
  require "extended_dir"
  files = ExtendedDir.files("#{__dir__}/lib", order: %w[extra/mixin.rb, core/base.rb])
  
  # the files are returned prioritized in the load order if specified, 
  # and in default sort order if not

  files #=> lib/extra/mixin.rb, lib/core/base.rb, lib/a.rb, lib/b.rb

  # or load them in order

  ExtendedDir.load_all("#{__dir__}/lib", order: %[extra/mixin.rb, core/base.rb])

  # or require them in order

  ExtendedDir.require_all("#{__dir__}/lib", order: %w[extra/mixin.rb, core/base.rb])

```