require 'gosu'

class MapTile
  HEIGHT = 50
  WIDTH = 50
  attr_accessor :window, :type, :x, :y

  def initialize(window, raw_type, x = 0, y = 0)
    @window = window  
    @type = get_type(raw_type)
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

  def get_type(raw_type)
    case raw_type
    when 'G'
      :grass
    when 'W'
      :water
    when 'D'
      :dirt
    when 'T'
      :tree
    end
  end

  def hex_color
    case @type
    when :grass
      Gosu::Color.argb(255, 0, 102, 0)
    when :dirt
      Gosu::Color.argb(255, 102, 51, 0)
    when :water
      Gosu::Color.argb(255, 102, 178, 255)
    when :tree
      Gosu::Color.argb(255, 0, 204, 0)
    end
  end
end