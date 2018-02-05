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

uneConsequence = false

for i in 0..array.length()-1
  #puts array[i]
  case array[i]
  when "id"
    id = array[i+1]
  when "desc"
    desc = ""
    k = i+1
    while array[k] != "ch1"
      desc << " " <<  array[k]
      k = k+1
    end
  when "ch1"
    ch1 = ""
    k = i+1
    while array[k] != "csq1"
      ch1 << " " <<  array[k]
      k = k+1
    end
  when "csq"
    csq = ""
    k = i+1
    while array[k] != "fincarte"
      csq << " " <<  array[k]
      k = k+1
    end
  when "csq1"
    csq1 = ""
    k = i+1
    while array[k] != "csq2"
      csq1 << " " <<  array[k]
      k = k+1
    end
  when "csq2"
    csq2 = ""
    k = i+1
    while array[k] != "fincarte"
      csq2 << " " <<  array[k]
      k = k+1
    end
  when "fincarte"
    if uneConsequence
      carte.new(id,desc,[],[csq])
    else
      carte.new(id,desc,[ch1,ch2],[csq1,csq2])
    end 
  end
end
end


chargerCarte()

def aleaCartes #return une carte
  cartes = ["test1","test2","test3"] #à remplacer
  i = rand(cartes.size)
  return cartes[i]
end
