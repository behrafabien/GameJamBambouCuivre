require_relative 'window.rb'

WindowWidth = 620
WindowHeight = 800

window = Window.new(WindowWidth, WindowHeight)
window.show






def chargerCarte
  array = []
  File.open("cartes.txt") do |file|
  data = file.readlines

  data.each do |line|
    line.split.each do |word|
      array.push(word)
    end
  end
end

for i in 0..array.length()-1
  puts array[i]
  case array[i]
  when "id"
    id = array[i+1]
  when "desc"
    desc = ""
    k = i+1
    while array[k] != "ch1"
      desc.to_s + array[k].to_s
      k = k+1
    end
    puts "@@@@@@@@@@@@@@@"
    puts desc
  end
end
end


chargerCarte()

def aleaCartes #return une carte
  cartes = ["test1","test2","test3"] #à remplacer
  i = rand(cartes.size)
  return cartes[i]
end
