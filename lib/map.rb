require 'gosu'
require './lib/map_tile'

class Map
  attr_accessor :window

  def initialize(window)
    @window = window
    @tiles = []

    populate_tiles
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

  def populate_tiles
    text = File.open("./assets/small_farm.dat").read

    line_counter = 0
    char_counter = 0
    
    text.each_line do |line|
      @tiles.push []

      line.each_char do |char|
        @tiles[line_counter].push char
      end

      line_counter += 1
    end
  end

  def get_color(x, y)
    tile = @tiles[x][y]

    case tile
    when 'G'
      :green
    when 'W'
      :blue
    when 'D'
      :brown
    when 'T'
      :dark_green
    end
  end
end