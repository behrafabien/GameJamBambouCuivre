class Controleur

attr_reader :cartes, :cartepioche, :statut, :joursrestant

def initialize
  @cartes = self.chargerCarte()
  @pioche = []
  @statut = Statut.new(50,50,50,50)
  @joursrestant = 5
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
      String desc = ""
      k = i+1
      while array[k] != "ch1" && array[k] != "csq"
        if array[k]!='\n'
          desc << " " << array[k]
        else
          desc << " " << "\n"
        end
        k = k+1
      end
    when "ch1"
      String ch1 = ""
      k = i+1
      while array[k] != "csq1"
        if array[k]!='\n'
          ch1 << " " << array[k]
        else
          ch1 << " " << "\n"
        end
        k = k+1
      end

    when "csq1"
      String csq1 = ""
      k = i+1
      while array[k] != "exp1"
        if array[k]!='\n'
          csq1 << " " << array[k]
        else
          csq1 << " " << "\n"
        end
        k = k+1
      end
    when "exp1"
      String exp1 = ""
      k = i+1
      while array[k] != "ch2"
        if array[k]!='\n'
          exp1 << " " << array[k]
        else
          exp1 << " " << "\n"
        end
        k = k+1
      end
    when "ch2"
      String ch2 = ""
      k = i+1
      while array[k] != "csq2"
        if array[k]!='\n'
          ch2 << " " << array[k]
        else
          ch2 << " " << "\n"
        end
        k = k+1
      end
    when "csq2"
      String csq2 = ""
      k = i+1
      while array[k] != "exp2"
        if array[k]!='\n'
          csq2 << " " << array[k]
        else
          csq2 << " " << "\n"
        end
        k = k+1
      end
    when "exp2"
      String exp2 = ""
      k = i+1
      while array[k] != "fincarte"
        if array[k]!='\n'
          exp2 << " " << array[k]
        else
          exp2 << " " << "\n"
        end
        k = k+1
      end
    when "csq"
      uneConsequence = true
      String csq = ""
      k = i+1
      while array[k] != "exp"
        if array[k]!='\n'
          csq << " " << array[k]
        else
          csq << " " << "\n"
        end
        k = k+1
      end
    when "exp"
      String exp = ""
      k = i+1
      while array[k] != "fincarte"
        if array[k]!='\n'
          exp << " " << array[k]
        else
          exp << " " << "\n"
        end
        k = k+1
      end
    when "fincarte"
      if uneConsequence
        cartes.push(Carte.new(id,desc,ch1,ch2,csq,csq,exp,exp))
      else
        cartes.push(Carte.new(id,desc,ch1,ch2,csq1,csq2,exp1,exp2))
      end
      uneConsequence = false
      desc = ""
      exp = ""
      exp1 = ""
      exp2 = ""
      ch1 = ""
      ch2 = ""
      csq = ""
      csq1 = ""
      csq2 = ""
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
    @joursrestant = @joursrestant - 1



#  end
end

def resetJours
  @joursrestant = 5
end

def isWin
  if @joursrestant.to_i == 1
    return true
  else
    return false
  end
end




end
