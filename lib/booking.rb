require 'capybara'
require 'capybara/dsl'

class Booking
  include Capybara::DSL
  def self.login
    session = Capybara::Session.new(:webkit)
    session.visit('https://admin.booking.com/')
    session.fill_in 'loginname', with: '1342069'
    session.fill_in 'password', with: 'testing987!'
    session.find('.btn-primary').click

    table_results = session.all('#group_login_overview td').map do |row|
      row.text 
    end
    p table_results
  end

  def self.logout
    session = Capybara::Session.new(:webkit)
    session.visit('https://admin.booking.com/')
    session.visit('https://admin.booking.com/')
    session.fill_in 'loginname', with: '1342069'
    session.fill_in 'password', with: 'testing987!'
    session.find('.btn-primary').click
    session.find('.logout').click
    p session.find('.login-form-title').text
  end
end