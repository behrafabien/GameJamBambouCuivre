class Carte

  attr_reader :id, :desc, :choix1, :consequence1, :explications1, :texte, :choix2, :consequence2, :explication2, :textechoix1, :textechoix2, :image
  def initialize(id, desc, choix1, choix2, consequence1, consequence2, explications1,explications2)
    @textechoix1 = ""
    @textechoix2 = ""
    @id = id
    @desc = desc
    @choix1 = choix1
    @consequence1 = consequence1
    @explications1 = explications1
    @choix2 = choix2
    @consequence2 = consequence2
    @explications2 = explications2
    @image = Gosu::Image.new('images/'+@id+'.jpg')

  end

  def retourLigne
    descRetourLigne=""
    longueur = 0
    i = 0
    @desc.split.each do |word|

      case
      when longueur != 6
        descRetourLigne = descRetourLigne+word+' '
        longueur = longueur+1
      when longueur = 6
        descRetourLigne = descRetourLigne+word
        longueur = 0
        descRetourLigne = descRetourLigne+" \n "
      end
    end
    @texte = Gosu::Image.from_text(descRetourLigne, 22)
  end



  def retourLigneChoix
    if choix1 != ""
      choix1RetourLigne = ""
      longueur = 0
      @choix1.split.each do |word|
        case
        when longueur != 5
          choix1RetourLigne = choix1RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 5
          choix1RetourLigne = choix1RetourLigne+word
          longueur = 0
          choix1RetourLigne=choix1RetourLigne + " \n "
        end
      end
      @textechoix1 = Gosu::Image.from_text(choix1RetourLigne,16)
      choix2RetourLigne = ""
      longueur = 0

      @choix2.split.each do |word|
        case
        when longueur != 5
          choix2RetourLigne = choix2RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 5
          choix2RetourLigne = choix2RetourLigne+word
          longueur = 0
          choix2RetourLigne=choix2RetourLigne + " \n "
        end
      end
      @textechoix2 = Gosu::Image.from_text(choix2RetourLigne,16)

    else
      choixuniquetest = " OK ! "
      @textechoix1 = Gosu::Image.from_text(choixuniquetest,28)
    end

  end

end
