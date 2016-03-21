---
layout: post
title: Using VCR 3 with Rails 4
---
All the guides on using VCR with Rails that I found in my googling was from 2012 or older. This ended up being super easy but I still ended up wasting time trying to find a newer reference.

Put this in your `Gemfile`

    group :test do
      gem 'vcr'
      gem 'webmock'
    end

Put the following in your `spec/spec_helper.rb`
    require 'vcr'

    VCR.configure do |c|
      c.cassette_library_dir = 'spec/cassettes'
      c.hook_into :webmock
      c.configure_rspec_metadata!
    end

    RSpec.configure do |config|

And then finally. In the specs that make the web requests you want to record, put `, :vcr do` right after the description
