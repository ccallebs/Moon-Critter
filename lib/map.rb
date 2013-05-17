require 'gosu'
require './lib/map_tile'

class Map
  attr_accessor :window

  def initialize(window)
    @window = window
  end

  def draw
    horizontal_tiles = 800 / 50
    vertical_tiles = 800 / 50

    horizontal_tiles.times do |x|
      vertical_tiles.times do |y|
        MapTile.new(@window, get_color(x, y), x * 50, y * 50).draw
      end
    end
  end

private 

  def get_color(x, y)
    if x % 3 == 1 || x % 3 == 2
      if y % 3 == 1
        :green
      else
        :brown
      end
    else
      :blue
    end
  end
end