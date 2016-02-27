# EnvCompat

Your tool for converting special characters to ENV friendly variables.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'env_compat', '~> 0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install env_compat

## Usage

```ruby
EnvCompat.encode "https://github.com/company/private-repo.git"
# => "HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 

EnvCompat.decode "HTTPS_CFF_GITHUB_D_COM_F_COMPANY_F_PRIVATE_M_REPO_D_GIT" 
# => HTTPS://GITHUB.COM/COMPANY/PRIVATE-REPO.GIT
```

To define you own custom special character mappings feel free to overwrite
the EnvCompat module instance method of `:mapping`.  **NOTE:** When changing
mapping the underscore symbol must be mapped.

```ruby
def EnvCompat.mapping
  {
    '1' => '/', # Forward Slash
    '2' => ':', # Colon
    '3' => '-', # Minus
    '4' => '_', # Underscore
    '5' => '.'  # Dot
  }
end

EnvCompat.encode "https://github.com/company/private-repo.git"
# => "HTTPS_211_GITHUB_5_COM_1_COMPANY_1_PRIVATE_3_REPO_5_GIT"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielpclark/env_compat.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

