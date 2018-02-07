class Controleur

attr_reader :cartes, :cartepioche, :statut

def initialize
  @cartes = self.chargerCarte()
  for i in 0..@cartes.length-1

    @cartes[i].retourLigne()
    @cartes[i].retourLigneChoix()
  end
  @statut = Statut.new(50,50,50,50)
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
  sortie = false

  for i in 0..array.length()-1

    case array[i]
    when "id"
      id = array[i+1]
    when "desc"
      desc = ""
      k = i+1
      while array[k] != "ch1" && array[k] != "csq"
        desc.to_s << " " <<  array[k].to_s
        k = k+1
      end
    when "ch1"
      @ch1 = ""
      k = i+1
      while array[k] != "csq1"
        @ch1 << " " <<  array[k]
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
      @ch2 = ""
      k = i+1
      while array[k] != "csq2"
        @ch2 << " " <<  array[k]
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
        exp.to_s << " " << array[k].to_s
        k = k+1
      end
    when "fincarte"
      if uneConsequence
        cartes.push(Carte.new(id,desc,@ch1,@ch2,csq,csq,exp,exp))
      else
        cartes.push(Carte.new(id,desc,@ch1,@ch2,csq1,csq2,exp1,exp2))
      end
      uneConsequence = false
      desc = ""
      @ch1 = ""
      @ch2 = ""
      csq = ""
      exp = ""
      csq1 = ""
      csq2 = ""
      exp2 = ""
      exp1 = ""
    end
  end
  return cartes
end

  def aleaCartes(array) #return une carte
    cartes = @cartes #à remplacer
    i = rand(cartes.length)
    return cartes[i]
  end



def gamestarted
  #charge les cartes


    @cartepioche = self.aleaCartes(@cartes)


#  end
end








end
