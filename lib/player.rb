require 'gosu'

class Player
  attr_accessor :window, :image, :movement_counter

  attr_accessor :x, :y

  def initialize(window)
    self.window = window
    @image = Gosu::Image.new(@window, 'media/player.png', false)
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
    @x += 50
    puts "moving right."
  end

  def move_left
    @x -= 50
    puts "moving left."
  end

  def move_up
    @y -= 50
    puts "moving up."
  end

  def move_down
    @y += 50
    puts "moving down."
  end

  def angle_up
    @angle += 0.1
  end

end