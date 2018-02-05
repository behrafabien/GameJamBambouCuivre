class Cartes
  attr_reader :id, :desc, :choix, :consequence
  def initialize
        @id = id
        @desc = desc
        @choix = choix
        @consequence = consequence
  end
  def id=(new_id)
        @id = new_id
  end
  def desc=(new_desc)
        @desc = new_desc
  end
  def choix=(new_choix)
        @choix = new_choix
  end
  def consequence=(new_consequence)
        @consequence = new_consequence
  end
end
