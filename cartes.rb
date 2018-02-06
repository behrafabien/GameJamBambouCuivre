class Carte
  attr_reader :id, :desc, :choix, :consequence, :explications
  def initialize(id, desc, choix, consequence, explications)
        @id = id
        @desc = desc
        @choix = []
        @consequence = []
        @explications = []
  end

  def id=(new_id)
        @id = new_id
  end

  def desc=(new_desc)
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
