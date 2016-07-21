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
    session.all('.hotel_row tr').each do |tr|
      puts tr.text
    end
    #session.save_and_open_page
  end
end