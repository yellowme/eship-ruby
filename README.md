# Eship::Ruby

Eship-ruby es una gema para interactuar con la API de segmail proporciona a través del servicio de paqueterías Eship. Con esta gema es posible generar una orden en el `dashboard` del servicio y continuar el proceso manualmente sin tener que ingresar los datos del remitente y el destinatario de manera manual.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eship-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eship-ruby

## Usage
During the setup configuration you must add your eship api-key.
```sh
    Eship.config do |config|
        config.base_uri = 'https://app.myeship.co/API/'
        config.eship_key = 'Randomkey12x'
    end
```
### making querys
Eship-ruby expects the payload as described in the eship documentation https://myeship.co/docs/
```sh
response = Eship.post_quotation(payload)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/eship-ruby.
