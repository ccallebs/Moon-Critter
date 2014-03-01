require 'gosu'
require './lib/player'
require './lib/map'
require './lib/overlay'

class GameWindow < Gosu::Window
  CAPTION = "Moon Critter | Alpha"
  HEIGHT = 800
  WIDTH = 800

  attr_accessor :movement_counter

  def initialize
    super(HEIGHT, WIDTH, false)
    self.caption = CAPTION
    @player = Player.new(self)
    @map = Map.new(self)
    @overlay = Overlay.new(self)
  end

  def update
    @player.update
  end

  def draw
    @overlay.draw
    @player.draw
    @map.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close  # exit on press of escape key
    end
  end
end
