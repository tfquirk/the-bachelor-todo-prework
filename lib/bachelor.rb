require 'pry'

def get_first_name_of_season_winner(data, season)
  winner_name = ""
  data.each do |year, info|
    if year.to_s == season
      info.each do |item|
        item.each do |contestant_label, contestant_info|
          if data[year][0][contestant_label] == "Winner"
            winner_name = data[year][0]["name"]
          end
        end
      end
  end
end
  winner_name.split(" ").first

end

def get_contestant_name(data, occupation)
  contestant_name = ""

  data.each do |year, array|
    array.each do |info|
      info.each do |contestant_label, contestant_info|
        if contestant_info == occupation
          contestant_name << info["name"]
        end
      end
    end
  end

contestant_name
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |year, array|
    array.each do |info|
      info.each do |contestant_label, contestant_info|
        if contestant_info == hometown
          counter += 1
        end
      end
    end
  end
  counter
end

def get_occupation(data, hometown)

  career = []

  data.each do |year, array|
    array.each do |info|
      info.each do |contestant_label, contestant_info|
        if contestant_info == hometown
          career << info["occupation"]
        end
      end
    end
  end

  career.first
end

def get_average_age_for_season(data, season)

  avg_age = 0
  num_participants = 0

  data[season].each do |info|
      info.each do |contestant_label, contestant_info|
        if contestant_label == "age"
          avg_age += info["age"].to_f
          num_participants +=1
        end
      end
    end

  (avg_age/num_participants).round
end
