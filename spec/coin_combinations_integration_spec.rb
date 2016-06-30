require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the coin colletion path', {:type => :feature}) do
  it('takes a number of cents and returns the right combination of coins') do
    visit('/')
    fill_in('input', :with => '41')
    click_button('Go')
    expect(page).to have_content ("We are out of dimes, your change for 41 cents is 1 quarter 3 nickels 1 penny")
  end
  it('takes a number of cents and returns the right combination of coins') do
    visit('/')
    fill_in('input', :with => '78')
    click_button('Go')
    expect(page).to have_content ("We are out of dimes, your change for 78 cents is 3 quarters 3 pennies")
  end
end
