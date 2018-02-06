class Carte

  attr_reader :id, :desc, :choix, :consequence, :explications, :texte
  def initialize(id, desc, choix, consequence, explications)

        @id = id
        @desc = desc
        @choix = []
        @consequence = []
        @explications = []

  end

def retourLigne
  descRetourLigne=""
  longueur = 0
  i = 0
  @desc.split.each do |word|
    puts longueur
  case
  when longueur != 6
      descRetourLigne = descRetourLigne+word+' '
      longueur = longueur+1

  when longueur = 6
    descRetourLigne = descRetourLigne+word+' '

      longueur = 0
      descRetourLigne = descRetourLigne+" \n "
  end

  end

  @texte = Gosu::Image.from_text(descRetourLigne, 26)
end

  def id=(new_id)
        @id = new_id
  end

  def getdesc=(new_desc)
        @desc = new_desc
  end

  def choix=(new_choix)
        @choix = new_choix[]
  end

  def consequence=(new_consequence)
        @consequence = new_consequence[]
  end

  def explications=(new_explications)
    @explications = new_explications[]
  end

end
