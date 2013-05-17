require 'gosu'
require './lib/game_window'

class Player
  attr_accessor :window, :image, :movement_counter

  attr_accessor :x, :y

  def initialize(window)
    self.window = window
    @image = Gosu::Image.new(@window, 'assets/player.png', false)
    @x = 25
    @y = 25
    @movement_counter = 0
  end

  def update
    @movement_counter += 1
    return unless @movement_counter % 10 == 0

    if @window.button_down? Gosu::KbRight
      move_right
    elsif @window.button_down? Gosu::KbLeft
      move_left
    elsif @window.button_down? Gosu::KbDown
      move_down
    elsif @window.button_down? Gosu::KbUp
      move_up
    end
  end

  def draw
    @image.draw_rot(@x, @y, 2, 0.0)
  end

private

  # Movement Methods

  def move_right
    new_x = @x + 50 
    unless new_x == GameWindow::WIDTH + 25
      @x = new_x
      puts "moving right."
    end
  end

  def move_left
    new_x = @x - 50
    unless new_x == -25
      @x = new_x
      puts "moving left."
    end
  end

  def move_up
    new_y = @y - 50
    unless new_y == -25
      @y = new_y
      puts "moving up."
    end
  end

  def move_down
    new_y = @y + 50
    unless new_y == GameWindow::HEIGHT + 25
      @y += 50
      puts "moving down."
    end
  end

end