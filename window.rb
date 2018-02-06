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

    #@cartes = @controleur.chargerCarte()

    @controleur = controleur
    for i in 0..@controleur.cartes.length-1
      puts @controleur.cartes[i].desc
      puts @controleur.cartes[i].choix1
      puts @controleur.cartes[i].choix2


    end
    @Width = width
    @Height = height
    super width,height # Crée une fenêtre de taille height * width
    @font = Gosu::Font.new(self, "assets/pixel.ttf", 80)
    @fontstatut = Gosu::Font.new(self, "Arial", 12)
    @fontdesc = Gosu::Font.new(self, "Arial", 16)

    self.caption = "Etudiant Simulator 3003" # Nom de la fenêtre
    @menu = true
    @gamestarted = false
    @creditstarted = false
    @background = Gosu::Image.new('assets/background.png')
    @cursor = Gosu::Image.new('assets/cursorGauntlet_bronze.png')
    @panelbackground = Gosu::Image.new('assets/panel_brown_background.png')
    @panelsetbackground = Gosu::Image.new('assets/panelset_beige_background.png')
    @titlepanel = Gosu::Image.new('assets/buttonTitle_blue.png')

    @startbutton = Gosu::Image.new('assets/buttonLong_blue2.png')
    @startbuttonpressed = Gosu::Image.new('assets/buttonLong_blue_pressed.png')
    @creditbutton = Gosu::Image.new('assets/buttonLong_blue.png')
    @creditbuttonpressed = Gosu::Image.new('assets/buttonLong_blue_pressed.png')
    @exitbutton = Gosu::Image.new('assets/buttonLong_blue.png')
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
    if !@controleur.statut.defaite

    else
      @gamestarted = false
      puts "Ta mere ta perdu salope"
      @controleur.statut.reset()
    end
  end

  def draw
    @cursor.draw(mouse_x,mouse_y,50)
    if @gamestarted




      Gosu::draw_rect(0, 0, 640, 800, COLORS[:blue])
      #@buttonexit.draw(560,20,2)
    @buttonretour.draw(25,20,2)

    # AFFICHAGE DU STATUT
    self.drawStatut()

      #AFFICHAGE DE LA CARTE
      @cardbackground.draw(40,200,0)
      @cardpanelset.draw(60,220,1)
      #texteDesc = @controleur.cartepioche.desc
      #@fontdesc.draw(texteDesc,80,500,3,1,1,COLORS[:white], mode = :default)
      @controleur.cartepioche.texte.draw(80,480,3)

    #  @image.draw_as_quad(80,240,COLORS[:white],80,500,COLORS[:white],550,500,COLORS[:white],550,240,COLORS[:white],5)
      @controleur.cartepioche.image.draw_as_quad(80,240,COLORS[:white],540,240,COLORS[:white],540,460,COLORS[:white],80,460,COLORS[:white],5)


      #AFFICHAGE DES CHOIX
      @statutbackground.draw(40,620,0)

      if @controleur.cartepioche.choix1 == ""
        @buttonchoixsimple.draw(60,630,2)
        @controleur.cartepioche.textechoix1.draw(280,635,3)
      else
        @buttonchoix.draw(50,630,2)
        @controleur.cartepioche.textechoix1.draw(55,635,3)
        @buttonchoix.draw(315,630,2)
        @controleur.cartepioche.textechoix2.draw(320,635,3)
      end





    elsif @creditstarted
      @font.draw_rel("Crédits", @Width / 2, 150, 1, 0.5, 0.5)
      @font.draw_rel("LUCA Deslot", @Width / 2, 175, 1, 0.5, 0.5)
      @font.draw_rel("Fabien Behra", @Width / 2, 200, 1, 0.5, 0.5)
      @font.draw_rel("Adrien Prat", @Width / 2, 225, 1, 0.5, 0.5)
      @font.draw_rel("Jessy Chenavas", @Width / 2, 250, 1, 0.5, 0.5)


    elsif @menu
      @background.draw(0,0,0)
      @titlepanel.draw(100,40,1)
      @panelbackground.draw(40,240,1)
      #@panelsetbackground.draw(60,260,2)

      @startbutton.draw(BUTTONSTARTPOS[0],BUTTONSTARTPOS[1],BUTTONSTARTPOS[2])
      @font.draw_rel("JOUER", @Width / 2, 360, 4, 0.5, 0.5)
      @creditbutton.draw(BUTTONCREDITPOS[0],BUTTONCREDITPOS[1],BUTTONCREDITPOS[2])
      @font.draw_rel("CREDITS", @Width / 2, 500, 4, 0.5, 0.5)
      @exitbutton.draw(BUTTONEXITPOS[0],BUTTONEXITPOS[1],BUTTONEXITPOS[2])
      @font.draw_rel("QUITTER", @Width / 2, 640, 4, 0.5, 0.5)

      #Gosu::draw_rect(0, 0, 640, 800, COLORS[:blue])

    end
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
        @controleur.gamestarted()
      when mouse_x > BUTTONCREDITPOS[0] && mouse_y > BUTTONCREDITPOS[1] && mouse_x < BUTTONCREDITPOS[0]+BUTTONCREDITSIZE[0] && mouse_y < BUTTONCREDITPOS[1]+BUTTONCREDITSIZE[1]
        @creditstarted = true

      end


    end

  end
end

  def button_down(button)
    if button == Gosu::MS_LEFT
      if !@gamestarted
      case
      when mouse_x > BUTTONEXITPOS[0] && mouse_y > BUTTONEXITPOS[1] && mouse_x < BUTTONEXITPOS[0]+BUTTONEXITSIZE[0] && mouse_y < BUTTONEXITPOS[1]+BUTTONEXITSIZE[1]
        puts "Bouton exit enfoncé."
        close
      when mouse_x > BUTTONSTARTPOS[0] && mouse_y > BUTTONSTARTPOS[1] && mouse_x < BUTTONSTARTPOS[0]+BUTTONSTARTSIZE[0] && mouse_y < BUTTONSTARTPOS[1]+BUTTONSTARTSIZE[1]
        puts "Clique start enfoncé."

      when mouse_x > BUTTONCREDITPOS[0] && mouse_y > BUTTONCREDITPOS[1] && mouse_x < BUTTONCREDITPOS[0]+BUTTONCREDITSIZE[0] && mouse_y < BUTTONCREDITPOS[1]+BUTTONCREDITSIZE[1]
        @creditbutton = @creditbuttonpressed
        puts "Bouton crédit enfoncé"
      when mouse_x > BUTTONCROIXPOS[0] && mouse_y > BUTTONCROIXPOS[1] && mouse_x < BUTTONCROIXPOS[0]+BUTTONCROIXSIZE[0] && mouse_y < BUTTONCROIXPOS[1]+BUTTONCROIXSIZE[1]
        puts "Bouton CROIX enfoncé"
        close
      end
      end
    end
    if button == Gosu::MS_LEFT
      if @gamestarted
      case
      when mouse_x > BUTTONRETOURPOS[0] && mouse_y > BUTTONRETOURPOS[1] && mouse_x < BUTTONRETOURPOS[0]+BUTTONRETOURSIZE[0] && mouse_y < BUTTONRETOURPOS[1]+BUTTONRETOURSIZE[1]
        puts "Bouton rettour enfoncé"
        @menu = true
        @gamestarted = false



      when mouse_x > BUTTONCHOIX1POS[0] && mouse_y > BUTTONCHOIX1POS[1] && mouse_x < BUTTONCHOIX1POS[0]+BUTTONCHOIXSIZE[0] && mouse_y < BUTTONCHOIX1POS[1]+BUTTONCHOIXSIZE[1]
        puts "Bouton choix1 enfoncé"
        @controleur.statut.modifStatut(@controleur.cartepioche.consequence1)
        @time = Gosu::milliseconds
        @ttl = @time+5000
        while @time < @ttl
          @time = Gosu::milliseconds
        end
        @controleur.gamestarted()

      when mouse_x > BUTTONCHOIX2POS[0] && mouse_y > BUTTONCHOIX2POS[1] && mouse_x < BUTTONCHOIX2POS[0]+BUTTONCHOIXSIZE[0] && mouse_y < BUTTONCHOIX2POS[1]+BUTTONCHOIXSIZE[1]
        @controleur.statut.modifStatut(@controleur.cartepioche.consequence2)
        @time = Gosu::milliseconds
        @ttl = @time+5000
        while @time < @ttl
          @time = Gosu::milliseconds
        end
        @controleur.gamestarted()

    when mouse_x > BUTTONCHOIXSIMPLEPOS[0] && mouse_y > BUTTONCHOIXSIMPLEPOS[1] && mouse_x < BUTTONCHOIXSIMPLEPOS[0]+BUTTONCHOIXSIMPLESIZE[0] && mouse_y < BUTTONCHOIXSIMPLEPOS[1]+BUTTONCHOIXSIMPLESIZE[1]
          @controleur.statut.modifStatut(@controleur.cartepioche.consequence1)
          @time = Gosu::milliseconds
          @ttl = @time+5000
          while @time < @ttl
            @time = Gosu::milliseconds
          end
          @controleur.gamestarted()

      end
    end
    end

  end

end
