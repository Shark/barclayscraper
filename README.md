# Barclayscraper

This gem provides an easy way to get data from your [Barclaycard](https://barclaycard.de) account. Because Barclaycard does not support HBCI/FinTS it uses screen scraping using [Capybara](https://github.com/teamcapybara/capybara), [Selenium](https://www.seleniumhq.org) and headless [Chrome](https://www.google.com/intl/de_ALL/chrome/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'barclayscraper', git: 'https://github.com/Shark/barclayscraper.git
```

And then execute:

    $ bundle

Note that Chrome must be installed.

## Usage

Get transactions:

```ruby
account = Barclayscraper::Account.new(username: '', password: '', product_id: '')
puts account.transactions
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Shark/barclayscraper.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Barclayscraper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/barclayscraper/blob/master/CODE_OF_CONDUCT.md).
