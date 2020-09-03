# OmniAuth Mariana Tek

OmniAuth strategy for authenticating against Mariana Tek using OAuth 2.
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-marianatek'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-marianatek

## Usage

Integrate the strategy into your middleware.

```ruby
# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :marianatek, ENV['MARIANA_TEK_CLIENT_ID'], ENV['MARIANA_TEK_CLIENT_SECRET']
end
```

The route `/auth/marianatek` will become available to initiate authentication.
Set up the callback route `/auth/marianatek/callback` and tie to a controller action
to handle any post-authentication actions.

```ruby
# config/routes.rb

Rails.application.routes.draw do
  get '/auth/marianatek/callback', to: 'sample_controller#marianatek'
end

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
