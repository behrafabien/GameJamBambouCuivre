require 'gosu'
require_relative 'cartes.rb'

class Window < Gosu::Window

  COLORS =  {
    brown: Gosu::Color.new(153, 76, 0, 0),
    darkbrown: Gosu::Color.new(102, 51, 0, 0)
  }

  BUTTONSTARTPOS = [100,300,1]
  BUTTONSTARTSIZE = [420,80]
  BUTTONCREDITPOS = [100,420,1]
  BUTTONCREDITSIZE = [420,80]

  ESC = Gosu::Button::KbEscape

  def initialize (width, height)
    @Width = width
    @Height = height
    super width,height # Crée une fenêtre de taille height * width
    @font = Gosu::Font.new(self, "C:/Users/jessy/GameJamBambouCuivre/SpaceFont.ttf", 20)
    self.caption = "Etudiant Simulator 3003" # Nom de la fenêtre
    @gamestarted = false
    @creditstarted = false
    @startbutton = Gosu::Image.new('startbutton.png')
    @creditbutton = Gosu::Image.new('buttonLong_brown.png')
    @creditbuttonpressed = Gosu::Image.new('buttonLong_brown_pressed.png')

    @carteTest = Carte.new()
  end

  def update

  end

  def draw

    if @gamestarted
      @carteTest.draw()
    elsif @creditstarted
      @font.draw_rel("Crédits", @Width / 2, 150, 1, 0.5, 0.5)
      @font.draw_rel("LUCA Deslot", @Width / 2, 175, 1, 0.5, 0.5)
      @font.draw_rel("Fabien Behra", @Width / 2, 200, 1, 0.5, 0.5)
      @font.draw_rel("Adrien Prat", @Width / 2, 225, 1, 0.5, 0.5)
      @font.draw_rel("Jessy Chenavas", @Width / 2, 250, 1, 0.5, 0.5)



    else
      @startbutton.draw(BUTTONSTARTPOS[0],BUTTONSTARTPOS[1],BUTTONSTARTPOS[2])
      @creditbutton.draw(BUTTONCREDITPOS[0],BUTTONCREDITPOS[1],BUTTONCREDITPOS[2])

     Gosu::draw_rect(0, 0, 640, 150, COLORS[:darkbrown])
     Gosu::draw_rect(0, 150, 640, 550, COLORS[:brown])
     Gosu::draw_rect(0, 650, 640, 150, COLORS[:darkbrown])
    end
  end

  def needs_cursor?
    true
  end

  def button_up(button)
    if button == Gosu::MS_LEFT
      case
      when mouse_x > BUTTONSTARTPOS[0] && mouse_y > BUTTONSTARTPOS[1] && mouse_x < BUTTONSTARTPOS[0]+BUTTONSTARTSIZE[0] && mouse_y < BUTTONSTARTPOS[1]+BUTTONSTARTSIZE[1]
        @gamestarted = true
        puts "Clique start enfoncé."
      when mouse_x > BUTTONCREDITPOS[0] && mouse_y > BUTTONCREDITPOS[1] && mouse_x < BUTTONCREDITPOS[0]+BUTTONCREDITSIZE[0] && mouse_y < BUTTONCREDITPOS[1]+BUTTONCREDITSIZE[1]
        @creditstarted = true
        puts "Bouton crédit enfoncé"

      end


  end

  end

  def button_down(button)
    if button == Gosu::MS_LEFT
      case
      when mouse_x > BUTTONSTARTPOS[0] && mouse_y > BUTTONSTARTPOS[1] && mouse_x < BUTTONSTARTPOS[0]+BUTTONSTARTSIZE[0] && mouse_y < BUTTONSTARTPOS[1]+BUTTONSTARTSIZE[1]

        puts "Clique start enfoncé."
      when mouse_x > BUTTONCREDITPOS[0] && mouse_y > BUTTONCREDITPOS[1] && mouse_x < BUTTONCREDITPOS[0]+BUTTONCREDITSIZE[0] && mouse_y < BUTTONCREDITPOS[1]+BUTTONCREDITSIZE[1]

        @creditbutton = @creditbuttonpressed
        puts "Bouton crédit enfoncé"

      end

    end
    case button
    when ESC
      close
    end
  end

  end
