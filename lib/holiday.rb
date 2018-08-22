require 'pry'

  # given that holiday_hash looks like this:
  # holiday_supplies = {
  #   :winter => {
    #     :christmas => ["Lights", "Wreath"],
    #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #       :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #       :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #       :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

def second_supply_for_fourth_of_july(holiday_supplies)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, item)
 holiday_hash[:winter].each do |holiday, decorations|
   decorations << item
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end


def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

# FUNCTION 6 - VERY TRICKY

def all_supplies_in_holidays(holiday_hash)           
  holiday_hash.each do |season, holiday|
     puts "#{season.capitalize}:"
     holiday.each do |holiday, item|
       puts "  #{holiday.to_s.split("_").map {|i| i.capitalize}.join(" ")}: #{item.join(", ")}"
     end
  end 
end

# Desired Layout

# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.


def all_holidays_with_bbq(holiday_hash)
  bbq_hols = []
  holiday_hash.collect do |season, holiday|
    holiday.map do |holiday, item|
      if item.include?("BBQ")
        bbq_hols << holiday
      end
    end 
  end 
  bbq_hols
end 

# ALTERNATIVELY

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.map do |season, holiday|
    holiday.map do |holiday, item|
      holiday if item.include?("BBQ")      # THIS IS NEAT - it sorts out holidays
    end 
  end.flatten.compact           # IMPLICITLY FLATTENS the HOLIDAYS
end



        
      
      





