class Overlay
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(@window, Gosu::default_font_name, 20)
  end

  def draw
    @font.draw("Day: 0", 10, 10, 5, 1.0, 1.0, 0xffffff00)
  end
end
