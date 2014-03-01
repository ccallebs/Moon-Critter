require 'gosu'
require './lib/player'
require './lib/map'

class GameWindow < Gosu::Window
  CAPTION = "Moon Critter | Alpha"
  HEIGHT = 800
  WIDTH = 800

  attr_accessor :movement_counter

  def initialize
    super(HEIGHT, WIDTH, false)
    self.caption = CAPTION
    @map = Map.new(self)
    @player = Player.new(self, @map)
  end

  def update
    @player.update
  end

  def draw
    @player.draw
    @map.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close  # exit on press of escape key
    end
  end
end
