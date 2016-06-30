require('rspec')
require('coin_combinations')

describe('Fixnum#return_coins') do
  it("returns the number one for one cent") do
    expect((1).return_coins()).to(eq("1 penny"))
  end

  it("returns the number one for one cent") do
    expect((6).return_coins()).to(eq("1 nickel 1 penny"))
  end

  it("returns the number one for one cent") do
    expect((16).return_coins()).to(eq("1 dime 1 nickel 1 penny"))
  end

  it("returns the number one for one cent") do
    expect((41).return_coins()).to(eq("1 quarter 1 dime 1 nickel 1 penny"))
  end
end
