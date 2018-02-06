class Carte

  attr_reader :id, :desc, :choix, :consequence, :explications, :texte
  def initialize(id, desc, choix, consequence, explications)

        @id = id
        @desc = desc
        @choix = []
        @consequence = []

        @texte = Gosu::Image.from_text(desc, 16)


        @explications = []

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
