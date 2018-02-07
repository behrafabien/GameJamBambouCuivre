class Statut
  attr_accessor :presence, :notes, :popularite, :moral

  def initialize(presence,notes,popularite,moral)
    @presence=presence
    @notes=notes
    @popularite=popularite
    @moral = moral
  end

  def defaite
    if presence >=100
      return "Quel dommage, en voulant aller en cours, tu t'es préscipité, et tu t'es fait renversé par une voiture! Rien ne sert de courir il faut partir à point!"
    elsif presence <=0
      return "Malheureusement, vos absences répétés vous ont transformé en fantôme, plus personne de l'IUT ne sait qui vous êtes!"
    elsif notes >=100
      return "Le deuxième de promo vous en veut, devenu instable après un partiel de Système d'Exploitation, il vous a poignardé afin de prendre votre place!"
    elsif notes <= 0
      return "A la vue de vos résultats, vous avez décidé d'intégrer les Carrières Juridiques, étonnement vous êtes premier de leur promo!"
    elsif popularite >=100
      return "Vous êtes tellement apprécié des gens, qu'ils ont décidé de vous sacrifier au grand dieu de la fête!"
    elsif popularite <= 0
      return "Si seul, vous vous lancez dans une carrière de youtuber où vous y ferez des dégustations et des pranks sur Minecraft"
    elsif moral >=100
      return "Vous êtes si joyeux que vous décidé de dire OUI à tout ce que l'on vous demande, vous finissez pauvre après avoir donné votre maison et tout votre argent à l'église de la Scientologie"
    elsif moral <=0
      return "Vous avez passé la semaine à coder un jeu sur un langage que vous ne connaissiez pas, vous vous retrouvez avec le moral au plus bas, vous tombez en dépression"
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
