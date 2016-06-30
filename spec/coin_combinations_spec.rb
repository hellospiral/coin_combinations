require('rspec')
require('coin_combinations')

describe('Fixnum#return_coins') do
  it("returns the number one for one cent") do
    expect((1).return_coins()).to(eq("your change for 1 cent is 1 penny"))
  end

  it("returns the number one for one cent") do
    expect((6).return_coins()).to(eq("your change for 6 cents is 1 nickel 1 penny"))
  end

  it("returns the number one for one cent") do
    expect((16).return_coins()).to(eq("We are out of dimes, your change for 16 cents is 3 nickels 1 penny"))
  end

  it("returns the number one for one cent") do
    expect((41).return_coins()).to(eq("We are out of dimes, your change for 41 cents is 1 quarter 3 nickels 1 penny"))
  end

  it('handles plural numbers') do
    expect((78).return_coins()).to(eq("We are out of dimes, your change for 78 cents is 3 quarters 3 pennies"))
  end
end
