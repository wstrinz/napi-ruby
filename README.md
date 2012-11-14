MaluubaNapi
===========

Maluuba nAPI is a new API that allows developers to add Natural Language Understanding (NLU)
to their software.

Features
--------

This API currently supports 22 different domains and around 70 different intents or actions.
We also parse out numerous entities. We believe that this API is the beginning of something great,
something that is going to completely change how people interact with their devices. But it is
just a beginning. We are starting out with the given domains, but plan on massively expanding it as
feature requests come in, and we see how people want to use this technology.

Access
------

Please sign up at the [Maluuba Developer Site](http://developer.maluuba.com) and apply for access.
We are currently in an alpha stage right now, and giving out API keys to interested third parties.
Once you have been approved, you will receive an API key that you can use with this client.

## Installation

Ruby 1.9.x is required, the easiest way to get it is to install it by following the instructions for RVM on [Ruby Downloads Page](http://www.ruby-lang.org/en/downloads/).

Add this line to your application's Gemfile:

    gem 'maluuba_napi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install maluuba_napi

Yard Docs
--------

Complete Yard Docs for the client library can be found [here](http://http://maluuba-napi-ruby.s3-website-us-east-1.amazonaws.com/).

## Usage

```ruby
>> require 'rubygems'
>> require 'maluuba_napi'
>> client = MaluubaNapi::Client.new 'your_apikey_here'
=> #<MaluubaNapi::Client:0x007fd17ca01ba8 @auth={:apikey=>"your_apikey_here"}> 
>> client.interpret phrase: 'Set up a meeting with Bob tomorrow night at 7 PM to discuss the TPS reports'
=> 
{:entities=>
    {:daterange=>[{:start=>"2012-11-15", :end=>"2012-11-16"}],
     :title=>["meeting to discuss the tps reports"],
     :timerange=>[{:start=>"12:00:00AM", :end=>"12:00:00AM"}],
     :contacts=>[{:name=>"bob"}]
    },
  :action=>:CALENDAR_CREATE_EVENT,
  :category=>:CALENDAR
}
>> client.normalize phrase: 'tomorrow', type: 'daterange', timezone: 'EST'
=> {:entities=>{:daterange=>[{:start=>"2012-11-15", :end=>"2012-11-16"}]}, :context=>{:timezone=>"EST"}}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Contact
-------

This API is still an early work in progress, so we greatly appreciate all the feedback we receive,
whether it's about bugs, features, or use cases. Here are some of the ways you can bring things
to our attention:

  * Send an e-mail to our mailing list at [napi@maluuba.com](mailto:napi@maluuba.com)
  * File an issue against our GitHub issue tracker (above)
  * Post on our [Support Forums](http://developer.maluuba.com/forum)
  * Join our [IRC channel (#maluuba on FreeNode)](irc://freenode.net/#maluuba) and talk to our developers in real-time
