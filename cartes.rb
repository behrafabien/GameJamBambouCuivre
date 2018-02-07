class Carte

  attr_reader :id, :desc, :choix1, :consequence1, :explications1, :texte, :choix2, :consequence2, :explications2, :textechoix1, :textechoix2, :image, :textexplication1, :textexplication2
  def initialize(id, desc, choix1, choix2, consequence1, consequence2, explications1,explications2)
    @textechoix1 = ""
    @textechoix2 = ""
    @texte = Gosu::Image.from_text(""+desc, 22)

    @id = id
    @desc = desc.to_s
    @choix1 = choix1.to_s
    @consequence1 = consequence1.to_s
    @explications1 = explications1.to_s
    @choix2 = choix2.to_s
    @consequence2 = consequence2.to_s
    @explications2 = explications2.to_s
    @image = Gosu::Image.new('images/'+@id+'.jpg')

    if choix1 != ""
      @textechoix1 = Gosu::Image.from_text(choix1,24)
      @textechoix2 = Gosu::Image.from_text(choix2,24)
    else
      @textechoix1 = Gosu::Image.from_text("OK!",24)
    end

    if explications1 != ""
      @textexplication1 = Gosu::Image.from_text(explications1,24)
      @textexplication2 = Gosu::Image.from_text(explications2,24)
    else
      @textexplication1 = Gosu::Image.from_text(explications1,24)
    end
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
        descRetourLigne = descRetourLigne+" \n"
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
        when longueur != 3
          choix1RetourLigne = choix1RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 3
          choix1RetourLigne = choix1RetourLigne+word
          longueur = 0
          choix1RetourLigne=choix1RetourLigne + " \n"
        end
      end
      @textechoix1 = Gosu::Image.from_text(choix1RetourLigne,24)
      choix2RetourLigne = ""
      longueur = 0

      @choix2.split.each do |word|
        case
        when longueur != 3
          choix2RetourLigne = choix2RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 3
          choix2RetourLigne = choix2RetourLigne+word
          longueur = 0
          choix2RetourLigne=choix2RetourLigne + " \n"
        end
      end
      @textechoix2 = Gosu::Image.from_text(choix2RetourLigne,24)

    else
      choixuniquetest = " OK ! "
      @textechoix1 = Gosu::Image.from_text(choixuniquetest,28)
    end

  end

  def retourLigneConsequence
    if consequence1 != ""
      consequence1RetourLigne = ""
      longueur = 0
      @explications1.split.each do |word|
        case
        when longueur != 3
          consequence1RetourLigne = consequence1RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 3
          consequence1RetourLigne = consequence1RetourLigne+word
          longueur = 0
          consequence1RetourLigne=consequence1RetourLigne + " \n"
        end
      end
      @textexplication1 = Gosu::Image.from_text(consequence1RetourLigne,24)
      consequence2RetourLigne = ""
      longueur = 0

      @explications2.split.each do |word|
        case
        when longueur != 3
          consequence2RetourLigne = consequence2RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 3
          consequence2RetourLigne = consequence2RetourLigne+word
          longueur = 0
          consequence2RetourLigne=consequence2RetourLigne + " \n"
        end
      end
      @textexplication2 = Gosu::Image.from_text(consequence2RetourLigne,24)

    else
      consequence1RetourLigne = ""
      longueur = 0
      @explication1.split.each do |word|
        case
        when longueur != 3
          consequence1RetourLigne = consequence1RetourLigne+word+' '
          longueur = longueur +1
        when longueur = 3
          consequence1RetourLigne = consequence1RetourLigne+word
          longueur = 0
          consequence1RetourLigne=consequence1RetourLigne + " \n"
        end
      end
        @textexplication1 = Gosu::Image.from_text(consequence1RetourLigne,28)

    end
  end

end
