require 'gosu'
require './lib/game_window'

class PlayerPosition
  attr_accessor :x, :y, :angle

  def initialize(options = {})
    @x = options[:x]
    @y = options[:y]
    @angle = options[:angle]
  end

  # Defining button_right, button_left, button_up, button_down
  [:right, :left, :up, :down].each do |direction|
    define_method("button_#{direction}") do 
      send("turn_#{direction}")
      send("move_#{direction}")
    end
  end

private

  # Turn Methods
  def turn_right
    @angle = 90.0
  end

  def turn_left
    @angle = 270.0
  end

  def turn_up
    @angle = 0.0
  end

  def turn_down
    @angle = 180.0
  end

  # Movement Methods
  def move_right
    new_x = @x + 50 
    unless new_x == GameWindow::WIDTH + 25
      @x = new_x
    end
  end

  def move_left
    new_x = @x - 50
    unless new_x == -25
      @x = new_x
    end
  end

  def move_up
    new_y = @y - 50
    unless new_y == -25
      @y = new_y
    end
  end

  def move_down
    new_y = @y + 50
    unless new_y == GameWindow::HEIGHT + 25
      @y += 50
    end
  end
end