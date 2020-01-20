# RailsAdminDiscard
A poor implementation of custom actions of rails admin to use discard gem.

## Usage
In your `rails_admin.rb`
```ruby
  config.actions do
    discard
  end
```

You may need to use in specific models:
```ruby
  config.actions do
    discard do
      only [YourModel]
    end
  end
```

if you want to remove delete:
```ruby
  config.actions do
    delete do
      except [YourModel]
    end
  end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_admin_discard'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_admin_discard
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
