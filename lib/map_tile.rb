require 'gosu'
require './lib/map_tiles/type'

class MapTile
  HEIGHT = 50
  WIDTH = 50
  attr_accessor :window, :type, :x, :y

  def initialize(window, raw_type, x = 0, y = 0)
    @window = window
    @type = MapTiles::Type.new(raw_type)
    @image = Gosu::Image.new(@window, @type.image_path, false) if @type.has_image?
    @x = x
    @y = y
  end

  def draw
    if @type.has_image?
      @image.draw_rot(@x + 25, @y + 25, 1, 0.0)
    else
      @window.draw_quad(@x, @y, @type.hex_color,
                        @x + WIDTH, @y, @type.hex_color,
                        @x, @y + HEIGHT, @type.hex_color,
                        @x + WIDTH, @y + HEIGHT, @type.hex_color, 1)
    end
  end
end
