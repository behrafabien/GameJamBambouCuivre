class Carte
  attr_reader :id, :desc, :choix, :consequence
  def initialize(id, desc, choix, consequence)
        @id = id
        @desc = desc
        @button = Gosu::Image.new('buttonLong_brown.png')
        @choix = []
        @consequence = []





        @button = Gosu::Image.new('assets/buttonLong_blue2.png')
  end

  def draw
    #Deux draw possible, si il y a deux choix, ou s'il y a qu'un choix
    if @choix.length == 1

    else

    end


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
