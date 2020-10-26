require "csv"

list = CSV.read("personal_data.csv", headers: true).map do |row|
  { name: row["名前"], age: row["年齢"].to_i, height: row["身長"].to_i }
end

def age_judge(data)
  data[:age] <= 64 ? "OK" : "NG"
end

def height_judge(data)
  data[:height] >= 130 ? "OK" : "NG"
end

def comprehensive_judge(data)
  age_judge(data) == "OK" && height_judge(data) == "OK" ? "ご利用いただけます" : "ご利用いただけません"
end

def disp_judge(list)
  count = 0
  list.each do |data|
    count += 1
    puts <<~TEXT
           ---------------------
           #{data[:name]}さん
           年齢  #{data[:age]}歳：年齢確認#{age_judge(data)}
           身長  #{data[:height]}cm：身長確認#{height_judge(data)}

           #{comprehensive_judge(data)}
         TEXT
  end
  puts "---------------------"
end

disp_judge(list)
