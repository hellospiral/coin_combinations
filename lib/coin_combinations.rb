require('pry')

class Fixnum
  available_coins = { 25 => 100, 10 => 1, 5 => 4, 1 => 10}

  define_method(:return_coins) do
    cents = self
    coins = { 25 => 0, 10 => 0, 5 => 0, 1 => 0}
    coins_names = { 25 => "quarter ", 10 => "dime ", 5 => "nickel ", 1 => "penny"}
    plural_coins_names = { 25 => "quarters ", 10 => "dimes ", 5 => "nickels ", 1 => "pennies"}
    keys = coins.keys()
    sorry_text = "We are out of "
    unavailable_coins= available_coins.map{ |k, v| v ==0 ? k : nil }.compact

    keys.each do |key|
        if key !=1
          coins_needed =  cents / key.to_i()
          remaining = 0
          if available_coins[key] >= coins_needed
            coins[key] = coins_needed;
            available_coins[key] -= coins[key]
          else
            number_of_unavailable_coins = unavailable_coins.length
            if number_of_unavailable_coins > 1
              sorry_text += plural_coins_names[key] + 'and '
            else
              sorry_text += plural_coins_names[key].strip() +'; '
            end
            coins[key] = available_coins[key]
            available_coins[key] = 0
            remaining = (coins_needed - coins[key]) * key
          end
          cents = cents % key + remaining
        else
          coins[key] =  cents / key.to_i()
      end
    end

    result_text = "your change for " + self.to_s() + " cents is "
    keys.each do |key|
      if coins[key] != 0
        if coins[key] > 1
          result_text += coins[key].to_s() + " " + plural_coins_names[key]
        else
          result_text += coins[key].to_s() + " " + coins_names[key]
        end
      end
    end

    if sorry_text != "We are out of "
      result_text.prepend(sorry_text)
    end
    result_text
  end
end
