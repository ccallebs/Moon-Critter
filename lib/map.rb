require 'gosu'
require './lib/map_tile'

class Map
  attr_accessor :window, :tiles

  def initialize(window)
    @window = window
    @char_map = []

    populate_char_map
    build_tiles
  end

  def draw
    horizontal_tiles = 800 / 50
    vertical_tiles = 800 / 50

    horizontal_tiles.times do |x|
      vertical_tiles.times do |y|
        if @tiles[x][y].nil?
          MapTile.new(@window, @char_map[x][y], x * 50, y * 50).draw
        else
          @tiles[x][y].draw
        end
      end
    end
  end

private 

  def populate_char_map
    text = File.open("./assets/small_farm.dat").read

    line_counter = 0
    char_counter = 0
    
    text.each_line do |line|
      @char_map.push []

      line.each_char do |char|
        @char_map[line_counter].push char
      end

      line_counter += 1
    end
  end

  def build_tiles
    @tiles = Array.new(@char_map.length, Array.new(@char_map[0].length))
  end

end