class Carte

  attr_reader :id, :desc, :choix1, :consequence1, :explications1, :texte, :choix2, :consequence2, :explications2, :textechoix1, :textechoix2, :image, :textexplication1, :textexplication2
  def initialize(id, desc, choix1, choix2, consequence1, consequence2, explications1,explications2)
    @textechoix1 = ""
    @textechoix2 = ""
    @texte = Gosu::Image.from_text(""+desc, 24)

    @id = id
    @desc = desc.to_s
    @choix1 = choix1.to_s
    @consequence1 = consequence1.to_s
    @explications1 = explications1.to_s
    @choix2 = choix2.to_s
    @consequence2 = consequence2.to_s
    @explications2 = explications2.to_s
    @image = Gosu::Image.new('images/'+@id+'.jpg')
    puts "Carte n°"<< @id<< "/50 OK!"


    if choix1 != ""
      @textechoix1 = Gosu::Image.from_text(choix1,22)
      @textechoix2 = Gosu::Image.from_text(choix2,22)
    else
      @textechoix1 = Gosu::Image.from_text("OK!",22)
    end

    if explications1 != ""
      @textexplication1 = Gosu::Image.from_text(explications1,24)
      @textexplication2 = Gosu::Image.from_text(explications2,24)
    else
      @textexplication1 = Gosu::Image.from_text(explications1,24)
    end

    puts "La carte numero "+id+" a bien été chargé."
  end
end
