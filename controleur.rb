class Controleur

attr_reader :cartes

def initialize
  super
end

def chargerCarte
    array = []
    cartes = []
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
    puts array[i]
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
    when "csq1"
      csq1 = ""
      k = i+1
      while array[k] != "exp1"
        csq1 << " " <<  array[k]
        k = k+1
      end
    when "exp1"
      exp1 = ""
      k = i+1
      while array[k] != "ch2"
        exp1 << " " << array[k]
        k = k+1
      end
    when "ch2"
      ch2 = ""
      k = i+1
      while array[k] != "csq2"
        ch2 << " " <<  array[k]
        k = k+1
      end
    when "csq2"
      csq2 = ""
      k = i+1
      while array[k] != "exp2"
        csq2 << " " <<  array[k]
        k = k+1
      end
    when "exp2"
      exp2 = ""
      k = i+1
      while array[k] != "fincarte"
        exp2 << " " << array[k]
        k = k+1
      end
    when "csq"
      uneConsequence = true
      csq = ""
      k = i+1
      while array[k] != "exp"
        csq << " " <<  array[k]
        k = k+1
      end
    when "exp"
      exp = ""
      k = i+1
      while array[k] != "fincarte"
        exp << " " << array[k]
        k = k+1
      end
    when "fincarte"
      if uneConsequence
        cartes.push(Carte.new(id,desc,[],[csq],[exp]))
      else
        cartes.push(Carte.new(id,desc,[ch1,ch2],[csq1,csq2],[exp1,exp2]))
      end
    end
  end
  return cartes
end

  def aleaCartes #return une carte
    cartes = ["test1","test2","test3"] #à remplacer
    i = rand(cartes.size)
    return cartes[i]
  end
end
