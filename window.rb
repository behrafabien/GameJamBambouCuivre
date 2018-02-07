require 'gosu'
require_relative 'cartes.rb'
require_relative 'statut.rb'




class Window < Gosu::Window

  COLORS =  {
    blue: Gosu::Color.new(63, 124, 182),
    lightbrown: Gosu::Color.new(211,191,143),
    white: Gosu::Color.new(255,255,255)
  }

  BUTTONSTARTPOS = [100,300,3]
  BUTTONSTARTSIZE = [420,120]
  BUTTONMENUPOS = [100,300,3]
  BUTTONMENUSIZE = [420,120]
  BUTTONCREDITPOS = [100,440,3]
  BUTTONCREDITSIZE = [420,120]
  BUTTONEXITPOS = [100,580,3]
  BUTTONEXITSIZE = [420,120]
  BUTTONCROIXPOS = [560,20,2]
  BUTTONCROIXSIZE = [35,35]
  BUTTONRETOURPOS = [20,20,2]
  BUTTONRETOURSIZE = [35,35]
  BUTTONCHOIX1POS = [50,630,3]
  BUTTONCHOIX2POS = [310,630,3]
  BUTTONCHOIXSIZE = [255,140]
  BUTTONCHOIXSIMPLEPOS = [60,630,2]
  BUTTONCHOIXSIMPLESIZE = [500,140]

  ESC = Gosu::Button::KbEscape

  def initialize (width, height, controleur)
    #VARIABLES
    @Width = width
    @Height = height
    @menu = true # On est au menu ?
    @gamestarted = false # Le jeu a t'il commencé ?
    @credits = false # On est au crédits ?
    @gameover = false # On est a l'écran de game over ?
    @controleur = controleur
    @explications = ""
    @explication = false

    #Création de la fenêtre
    super width,height
    self.caption = "Etudiant Simulator 3003" # Nom de la fenêtre

    #Polices d'écriture
    @font = Gosu::Font.new(self, "assets/pixel.ttf", 80)
    @fontstatut = Gosu::Font.new(self, "Arial", 12)
    @fontdesc = Gosu::Font.new(self, "Arial", 16)

    #Musique
    @song = Gosu::Song.new("musiques/Carefree.mp3")
    @song.volume = 0.25
    @song.play(true)

    #Images
      #Images du menu
        @background = Gosu::Image.new('assets/background.png')
        @cursor = Gosu::Image.new('assets/cursorGauntlet_bronze.png')
        @panelbackground = Gosu::Image.new('assets/panel_brown_background.png')
        @panelsetbackground = Gosu::Image.new('assets/panelset_beige_background.png')
        @titlepanel = Gosu::Image.new('assets/buttonTitle_blue.png')
        @startbutton = Gosu::Image.new('assets/buttonLong_blue2.png')
        @creditbutton = Gosu::Image.new('assets/buttonLong_blue2.png')
        @exitbutton = Gosu::Image.new('assets/buttonLong_blue2.png')
        @menubutton = Gosu::Image.new('assets/buttonLong_blue2.png')
        @buttonpressed = Gosu::Image.new('assets/button_blue_pressed.png')

      #Images de loading
        @loadinggif = Gosu::Image.new('assets/loadinggif.gif')
      #Images des crédits

      #Images du jeu
        @backgroundfeu = Gosu::Image.new('assets/buttonchoix.png')
        @buttonchoix = Gosu::Image.new('assets/buttonchoix.png')
        @buttonchoixsimple = Gosu::Image.new('assets/buttonchoixsimple.png')
        @buttonexit = Gosu::Image.new('assets/buttonExit.png')
        @buttonretour = Gosu::Image.new('assets/buttonRetour.png')
        @statutbackground = Gosu::Image.new('assets/status_brown_background.png')
        @barGreen_horizontalLeft=Gosu::Image.new('assets/barGreen_horizontalLeft.png')
        @barGreen_horizontalMid=Gosu::Image.new('assets/barGreen_horizontalMid2px.png')
        @barBlue_horizontalMid=Gosu::Image.new('assets/barBlue_horizontalMid2px.png')
        @barYellow_horizontalMid=Gosu::Image.new('assets/barYellow_horizontalMid2px.png')
        @barRed_horizontalMid=Gosu::Image.new('assets/barRed_horizontalMid2px.png')
        @barBack_horizontalMid=Gosu::Image.new('assets/barBack_horizontalMid2px.png')
        @cardbackground = Gosu::Image.new('assets/card_brown_background.png')
        @cardpanelset = Gosu::Image.new('assets/card_brown_panelset.png')
  end



  def update
    #On vérifie si le joueur n'a pas perdu
    if !@controleur.statut.defaite
      # S'il n'a pas perdu on ne fais rien
    else
      # S'il a perdu, le jeu s'arrête et on reset les statuts
      @gamestarted = false
      @gameover = true
      @controleur.statut.reset()
    end
  end

  def draw
    # On dessine le curseur au niveau de la position de la souris
    @cursor.draw(mouse_x,mouse_y,50)
    # Si le jeu est lancé
    if @gamestarted
      #Gosu::draw_rect(0, 0, 640, 800, COLORS[:blue])
      @feu = Gosu::Image.new("assets/feu.jpg")
      @feu.draw(0,0,0)
      @buttonretour.draw(25,20,2)

      # AFFICHAGE DU STATUT
      self.drawStatut()
      self.drawCarte(@controleur.cartepioche)
        #AFFICHAGE DE LA CARTE


    elsif @credits
      self.drawCredit
    elsif @menu
      self.drawMenu()
    elsif @gameover
      self.drawGameOver()
    elsif @explication

    end
  end

def drawCarte(carte)
  @cardbackground.draw(40,200,0)
  @cardpanelset.draw(60,220,1)
  carte.texte.draw(80,480,3)
  carte.image.draw_as_quad(80,240,COLORS[:white],540,240,COLORS[:white],540,460,COLORS[:white],80,460,COLORS[:white],5)
  #AFFICHAGE DES CHOIX
  @statutbackground.draw(40,620,0)
  if carte.choix2 == ""
    @buttonchoixsimple.draw(60,630,2)
    carte.textechoix1.draw(280,635,3)
  else
    @buttonchoix.draw(50,630,2)
    carte.textechoix1.draw(55,635,3)
    @buttonchoix.draw(315,630,2)
    carte.textechoix2.draw(320,635,3)
  end
end

def drawCredit
  @font.draw_rel("Crédits", @Width / 2, 150, 1, 0.5, 0.5)
  @font.draw_rel("LUCA Deslot", @Width / 2, 175, 1, 0.5, 0.5)
  @font.draw_rel("Fabien Behra", @Width / 2, 200, 1, 0.5, 0.5)
  @font.draw_rel("Adrien Prat", @Width / 2, 225, 1, 0.5, 0.5)
  @font.draw_rel("Jessy Chenavas", @Width / 2, 250, 1, 0.5, 0.5)
end

def drawMenu
  @background.draw(0,0,0)
  @titlepanel.draw(100,40,1)
  @panelbackground.draw(40,240,1)
  @startbutton.draw(BUTTONSTARTPOS[0],BUTTONSTARTPOS[1],BUTTONSTARTPOS[2])
  @font.draw_rel("JOUER", @Width / 2, 360, 4, 0.5, 0.5)
  @creditbutton.draw(BUTTONCREDITPOS[0],BUTTONCREDITPOS[1],BUTTONCREDITPOS[2])
  @font.draw_rel("CREDITS", @Width / 2, 500, 4, 0.5, 0.5)
  @exitbutton.draw(BUTTONEXITPOS[0],BUTTONEXITPOS[1],BUTTONEXITPOS[2])
  @font.draw_rel("QUITTER", @Width / 2, 640, 4, 0.5, 0.5)
end

def drawGameOver
  @background.draw(0,0,0)
  @font.draw_rel("GAME OVER", @Width / 2, 640, 4, 0.5, 0.5)
  @menubutton.draw(BUTTONMENUPOS[0],BUTTONMENUPOS[1],BUTTONMENUPOS[2])
end

def drawStatut
  #AFFICHAGE DU STATUT
   @statutbackground.draw(40,40,0)
   #AFFICHAGE DU STATUT MORAL
   @barGreen_horizontalLeft.draw(80,80,1)
   @fontstatut.draw("Moral",85,65,3,1,1,COLORS[:lightbrown])
   @test = @controleur.statut.moral# / 10
   @x = 80
   for i in 0..@test
     @barGreen_horizontalMid.draw(@x,80,1)
     @x = @x+2
   end
   for i in @test..99
     @barBack_horizontalMid.draw(@x,80,1)
     @x = @x+2
   end
   #AFFICHAGE DU STATUT NOTES
     @barBlue_horizontalMid.draw(80,120,1)
     @fontstatut.draw("Notes",85,105,3,1,1,COLORS[:lightbrown])
     @test = @controleur.statut.notes# / 10
     @x = 80
     for i in 0..@test
       @barBlue_horizontalMid.draw(@x,120,1)
       @x = @x+2
     end
     for i in @test..99
       @barBack_horizontalMid.draw(@x,120,1)
       @x = @x+2
     end
   #AFFICHAGE DU STATUT PRESENCE
     @barYellow_horizontalMid.draw(300,80,1)
     @fontstatut.draw("Pésence",305,65,3,1,1,COLORS[:lightbrown])
     @test = @controleur.statut.presence# / 10
     @x = 300
     for i in 0..@test
       @barYellow_horizontalMid.draw(@x,80,1)
       @x = @x+2
     end
     for i in @test..99
       @barBack_horizontalMid.draw(@x,80,1)
       @x = @x+2
     end
   #AFFICHAGE DU STATUT POPULARITE
     @barRed_horizontalMid.draw(300,120,1)
     @fontstatut.draw("Popularité",305,105,3,1,1,COLORS[:lightbrown])
     @test = @controleur.statut.popularite# / 10
     @x = 300
     for i in 0..@test
       @barRed_horizontalMid.draw(@x,120,1)
       @x = @x+2
     end
     for i in @test..99
       @barBack_horizontalMid.draw(@x,120,1)
       @x = @x+2
     end
end



  def button_up(button)
    if button == Gosu::MS_LEFT
      if !@gamestarted
      case
      when mouse_x > BUTTONSTARTPOS[0] && mouse_y > BUTTONSTARTPOS[1] && mouse_x < BUTTONSTARTPOS[0]+BUTTONSTARTSIZE[0] && mouse_y < BUTTONSTARTPOS[1]+BUTTONSTARTSIZE[1]
        @gamestarted = true
        @song.play(false)
        @song.volume = 0
        @doomsong = Gosu::Song.new("musiques/doom.mp3")
        @doomsong.volume = 0.25
        @doomsong.play(true)
        @controleur.gamestarted()
      when mouse_x > BUTTONCREDITPOS[0] && mouse_y > BUTTONCREDITPOS[1] && mouse_x < BUTTONCREDITPOS[0]+BUTTONCREDITSIZE[0] && mouse_y < BUTTONCREDITPOS[1]+BUTTONCREDITSIZE[1]
        @credits = true
        @menu = false

      end


    end

  end
end



  def button_down(button)
    case
      #Lorsque le jeu n'est pas lancé ( Pour les boutons du menu )
      when !@gamestarted
        if button == Gosu::MS_LEFT
        case
        when buttonPressed?(BUTTONSTARTPOS,BUTTONSTARTSIZE)
          @startbutton = @buttonpressed
        when buttonPressed?(BUTTONCREDITPOS,BUTTONCREDITSIZE)
          @creditbutton = @buttonpressed
        when buttonPressed?(BUTTONEXITPOS,BUTTONEXITSIZE)
          @exitbutton = @buttonpressed
          close
        end
        end

      # Lorsque le jeu est lancé
    when @gamestarted
      if button == Gosu::MS_LEFT
      case
      when buttonPressed?(BUTTONRETOURPOS,BUTTONRETOURSIZE)
        @song.play(true)
        @song.volume = 0.25
        @doomsong.play(false)
        @menu = true
        @gamestarted = false
      # Pour chaque bouton de choix si on appuie dessus on execute les modifications du statut relative a ce choix,
      # on repioche une carte pour passer a la suite
      when buttonPressed?(BUTTONCHOIX1POS,BUTTONCHOIXSIZE)
        @controleur.statut.modifStatut(@controleur.cartepioche.consequence1)
        @explications = @controleur.cartepioche.textexplication1
        @explication = true
        self.wait(0)
        @controleur.gamestarted()
      when buttonPressed?(BUTTONCHOIX2POS,BUTTONCHOIXSIZE)
        @controleur.statut.modifStatut(@controleur.cartepioche.consequence2)
        @explications = @controleur.cartepioche.textexplication2
        @explication = true
        self.wait(0)
        @controleur.gamestarted()
      when buttonPressed?(BUTTONCHOIXSIMPLEPOS,BUTTONCHOIXSIMPLESIZE)
        @controleur.statut.modifStatut(@controleur.cartepioche.consequence1)
        @explications = @controleur.cartepioche.textexplication1
        @explication = true
        self.wait(0)
        @controleur.gamestarted()
      end
    end
  when @gameover
      if button == Gosu::MS_LEFT
        if buttonPressed?(BUTTONMENUPOS,BUTTONMENUSIZE)
          @gameover = false
          @menu = true
        end
      end

  end



end

def buttonPressed?(buttonPos,buttonSize)
  if mouse_x > buttonPos[0] && mouse_y > buttonPos[1] && mouse_x < buttonPos[0]+buttonSize[0] && mouse_y < buttonPos[1]+buttonSize[1]
    return true
  else
    return false
  end
end


def wait(waittime)
  @time = Gosu::milliseconds
  @ttl = @time+waittime
  while @time < @ttl
    @time = Gosu::milliseconds
  end
end

end
