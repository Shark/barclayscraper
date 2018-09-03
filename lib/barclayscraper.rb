require 'date'
require 'bigdecimal'
require 'bigdecimal/util'

require 'capybara'
require 'selenium/webdriver'

require 'barclayscraper/version'

module Barclayscraper
  class Account
    def initialize(username:, password:, product_id:)
      @username = username
      @password = password
      @product_id = product_id
    end

    def transactions
      log_in

      transactions = session.find_all('table.datalist tbody tr').map do |row|
        columns = row.find_all('td')

        date = Date.strptime(columns[0].text, "%d.%m.%Y")

        memo = columns[2].text

        amount_text = columns[5].text
        amount = amount_text.tr('+-', '').gsub(/\./, '').tr(',','.').to_d
        amount = amount * -1 if amount_text[-1] == '-'

        { date: date, payee_name: nil, memo: memo, amount: amount }
      end

      log_out

      end_session

      transactions
    end

    private

    def log_in
      return if @logged_in

      session.visit('https://www.barclaycard.de')
      session.click_link('Log in')
      session.fill_in('Benutzername', with: username)
      session.fill_in('Passwort', with: password)
      session.click_link('Login')
      session.click_link(product_id)

      @logged_in = true
    end

    def log_out
      session.click_link('Logout')

      @logged_in = false
    end

    def session
      @session ||= Capybara::Session.new(:selenium_chrome_headless)
    end

    def end_session
      session.driver.quit
    end

    attr_reader :username, :password, :product_id
  end
end
