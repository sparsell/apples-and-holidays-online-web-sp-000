require 'pry'

holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  # return the second element in the 4th of July array
  return holiday_hash.dig :summer, :fourth_of_july, 1
end
#
# # add the second argument, which is a supply, to BOTH the
#   # Christmas AND the New Year's arrays
def add_supply_to_winter_holidays(holiday_hash, supply)
    holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, supply_array|
        supply_array << supply
          end
        end
      end
    end


    def add_supply_to_memorial_day(holiday_hash, supply)
      holiday_hash.each do |season, holiday|
        if season == :spring
          holiday.each { |holiday, data| data << supply }
        end
      end
    end

    def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
      holiday_hash[season][holiday_name] = supply_array
      holiday_hash
    end

def all_winter_holiday_supplies(holiday_hash)
holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |seasons, data|
    puts "#{seasons}:".capitalize
    data.each do |holidays, supplies|
      holidays = holidays.to_s.split("_")
      holidays = holidays.collect {|the_holiday| the_holiday.capitalize }.join(" ")
      supplies = supplies.join(", ")
      puts "  " + "#{holidays}: " + "#{supplies}"
      #binding.pry
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |season, data|
    data.each do |holiday, value|
      value.each do |supply|
        if supply == "BBQ"
          bbq_holidays.push(holiday)
        end
      end
    end
  end
  return bbq_holidays
end
