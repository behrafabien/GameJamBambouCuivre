require_relative 'window.rb'
require_relative 'cartes.rb'
require_relative 'controleur.rb'
WindowWidth = 620
WindowHeight = 800
@controleur = Controleur.new()
window = Window.new(WindowWidth, WindowHeight, @controleur)
window.show
