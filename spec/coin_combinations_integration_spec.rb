require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the coin colletion path', {:type => :feature}) do
  it('takes a number of cents and returns the right combination of coins') do
    visit('/')
    fill_in('input', :with => '41')
    click_button('Go')
    expect(page).to have_content ('1 quarter 1 dime 1 nickel 1 penny')
  end
  it('takes a number of cents and returns the right combination of coins') do
    visit('/')
    fill_in('input', :with => '73')
    click_button('Go')
    expect(page).to have_content ('2 quarters 2 dimes 3 pennies')
  end
end
