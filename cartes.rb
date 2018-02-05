class Carte
  attr_reader :id, :desc, :choix, :consequence
  def initialize(id, desc, choix, consequence)
        @id = id
        @desc = desc
        @button = Gosu::Image.new('buttonLong_brown.png')
        @choix = []
        @consequence = []
  end

  def draw
    @button.draw(100,600,1)
    @button.draw(320,600,1)

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

end
