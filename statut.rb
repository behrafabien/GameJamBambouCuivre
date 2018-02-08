class Statut
  attr_accessor :presence, :notes, :popularite, :moral

  def initialize(presence,notes,popularite,moral)
    @presence=presence
    @notes=notes
    @popularite=popularite
    @moral = moral

    @defaiteMaxPresent = Gosu::Image.from_text("Quel dommage, en voulant aller en cours, \n tu t'es préscipité, et tu t'es fait renversé \n par une voiture! Rien ne sert de courir \n il faut partir à point!",22)
    @defaiteMinPresent = Gosu::Image.from_text("Malheureusement, tes absences répétés t ont \n transformé en fantôme, plus personne de l'IUT \n ne sait qui tu es!",22)
    @defaiteMaxNotes = Gosu::Image.from_text("Le deuxième de promo t'en veut, devenu instable \n après un partiel de Système d'Exploitation, il t'as poignardé afin de prendre ta place!",22)
    @defaiteMinNotes = Gosu::Image.from_text("A la vue de tes résultats, tu as décidé d'intégrer \n les Carrières Juridiques, étonnement tu \n es premier de leur promo!",22)
    @defaiteMaxPopularite = Gosu::Image.from_text("Tu es tellement apprécié des gens, qu'ils \n ont décidé de te sacrifier au grand dieu de la fête!",22)
    @defaiteMinPopularite = Gosu::Image.from_text("Si seul, tu te lances dans une carrière de youtuber \n où tu y fera des dégustations et des pranks \n sur Minecraft",22)
    @defaiteMaxMoral = Gosu::Image.from_text("Tu es si joyeux que tu décides de dire OUI \n à tout ce que l'on te demande, tu finis pauvre après \n avoir donné ta maison et tout ton argent à l'église de la Scientologie",22)
    @defaiteMinMoral = Gosu::Image.from_text("Tu as passé la semaine à coder un jeu sur un langage \n que tu ne connaissais pas, tu te retrouves avec \n le moral au plus bas, tu tombes en dépression",22)
  end

  def defaite
    if presence >=100
      return @defaiteTropPresent
    elsif presence <=0
      return @defaitePasPresent
    elsif notes >=100
      return @defaiteMaxNotes
    elsif notes <= 0
      return @defaiteMinNotes
    elsif popularite >=100
      return @defaiteMaxPopularite
    elsif popularite <= 0
      return @defaiteMinPopularite
    elsif moral >=100
      return @defaiteMaxMoral
    elsif moral <=0
      return @defaiteMinMoral
    else
      return false
    end
  end

  def affiche
    puts "présence : #{@presence}"
    puts "notes : #{@notes}"
    puts "popularité : #{@popularite}"
    puts "moral : #{@moral}"
  end

  def analyseConsequencesChar(csq)
    charCsq = csq.split('') # charCsq est un tableau qui contient tous les caractères d'un mot

    tempStr = charCsq[3]
    if charCsq[4] != nil
      tempStr=tempStr+charCsq[4]
      if charCsq[5] != nil
        tempStr=tempStr+charCsq[5]
      end
    end
    val = tempStr.to_i

    case charCsq[0]
    when 'n'
      case charCsq[2]
      when '+'
        setNotes(getNotes+val)
      when '-'
        setNotes(getNotes-val)
      end

    when 'm'
      case charCsq[2]
      when '+'
        setMoral(getMoral+val)
      when '-'
        setMoral(getMoral-val)
      end

    when 'p'
      case charCsq[1]
      when 'r'
        case charCsq[2]
        when '+'
          setPresence(getPresence+val)
        when '-'
          setPresence(getPresence-val)
        end
      when 'o'
        case charCsq[2]
        when '+'
          setPopularite(getPopularite+val)
        when '-'
          setPopularite(getPopularite-val)
        end
      end
    end
  end

  def modifStatut(consequences)
    tabCsqs = []
    consequences.split.each do |word|
      tabCsqs.push(word)
    end # tabCsqs contient tous les mots du type mo+5 no-6 etc...

    #parcour du tableau
    for csq in tabCsqs
      analyseConsequencesChar(csq)
    end
  end


  def setNotes(notes)
    @notes=notes
  end
  def getNotes
    return notes
  end

  def setPresence(presence)
    @presence = presence
  end
  def getPresence
    return presence
  end

  def setPopularite(popularite)
    @popularite = popularite
  end
  def getPopularite
    return popularite
  end

  def setMoral(moral)
    @moral = moral
  end
  def getMoral
    return moral
  end

  def reset

    @popularite = 50
    @notes = 50
    @moral = 50
    @presence = 50

  end
end
