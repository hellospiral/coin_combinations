require('pry')

class Fixnum
  define_method(:coin_combinations) do
    cents = self
    num_of_quarters = cents / 25
    remainder_after_quarters = cents % 25
    num_of_dimes = remainder_after_quarters / 10
    remainder_after_dimes = remainder_after_quarters % 10
    num_of_nickels = remainder_after_dimes / 5
    num_of_pennies = remainder_after_dimes % 5
    answer = num_of_quarters.to_s() + ' quarters, ' + num_of_dimes.to_s() + ' dimes, ' + num_of_nickels.to_s() + ' nickels, ' + num_of_pennies.to_s() + ' pennies.'
  end

  define_method(:return_coins) do
    cents = self
    coins = { 25 => 0, 10 => 0, 5 => 0, 1 => 0}
    coins_names = { 25 => "quarter ", 10 => "dime ", 5 => "nickel ", 1 => "penny"}
    plural_coins_names = { 25 => "quarters ", 10 => "dimes ", 5 => "nickels ", 1 => "pennies"}
    keys = coins.keys()

    keys.each do |key|
      coins[key] =  cents / key.to_i()
      cents = cents % key
    end

    result_text = ""
    keys.each do |key|
      if coins[key] != 0
        if coins[key] > 1
          result_text += coins[key].to_s() + " " + plural_coins_names[key]
        else
          result_text += coins[key].to_s() + " " + coins_names[key]
        end
      end
    end
    result_text
  end


end
