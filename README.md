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
During the setup configuration you must add your eship api-key and the base URI.
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/eship-ruby.
