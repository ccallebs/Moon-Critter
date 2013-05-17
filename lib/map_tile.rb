require 'gosu'

class MapTile
  HEIGHT = 50
  WIDTH = 50
  attr_accessor :window, :color, :x, :y

  def initialize(window, color, x = 0, y = 0)
    @window = window  
    @color = color
    @x = x
    @y = y
  end

  def draw
    @window.draw_quad(@x, @y, hex_color,
                      @x + WIDTH, @y, hex_color,
                      @x, @y + HEIGHT, hex_color,
                      @x + WIDTH, @y + HEIGHT, hex_color, 1)
  end

private

  def hex_color
    case @color
    when :green
      Gosu::Color.argb(255, 0, 102, 0)
    when :brown
      Gosu::Color.argb(255, 102, 51, 0)
    when :blue
      Gosu::Color.argb(255, 102, 178, 255)
    when :dark_green
      Gosu::Color.argb(255, 0, 204, 0)
    end
  end
end