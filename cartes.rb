class Carte
  attr_reader :id, :desc, :choix, :consequence, :texte
  def initialize(id, desc, choix, consequence)
        @id = id
        @desc = desc
        @choix = []
        @consequence = []
        @texte = Gosu::Image.from_text(desc, 16)

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

end
