require 'gosu'


class Window < Gosu::Window

  ESC = Gosu::Button::KbEscape

  def initialize (width, height)
    @Width = width #1280
    @Height = height #640
    @font = Gosu::Font.new(20)
    super width,height # Crée une fenêtre de taille height * width
    self.caption = "Jeu Ruby" # Nom de la fenêtre
    @cursor = Gosu::Image.new(self, 'cursor.png')
  end

  def update

  end

  def draw
#@cursor.draw self.mouse_x, self.mouse_y, 0
  end

  def needs_cursor?
  true
  end

  def button_down(button)
    case button
    when ESC
      close
    end
  end

  end
