require 'gosu'
require './lib/game_window'
require './lib/player_position'

class Player
  attr_accessor :window, :image, :movement_counter

  attr_accessor :x, :y, :angle

  def initialize(window)
    self.window = window
    @image = Gosu::Image.new(@window, 'assets/player.png', false)
    @position = PlayerPosition.new(x: 25, y: 25, angle: 0.0)
    @movement_counter = 0
  end

  def update
    @movement_counter += 1
    return unless @movement_counter % 5 == 0

    if @window.button_down? Gosu::KbRight
      @position.button_right
    elsif @window.button_down? Gosu::KbLeft
      @position.button_left
    elsif @window.button_down? Gosu::KbDown
      @position.button_down
    elsif @window.button_down? Gosu::KbUp
      @position.button_up
    end
  end

  def draw
    @image.draw_rot(@position.x, @position.y, 2, @position.angle)
  end

end