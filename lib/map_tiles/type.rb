module MapTiles
  class Type
    def initialize(raw_type)
      @raw_type = raw_type
    end

    def ==(other)
      to_sym.equal? other
    end

    def to_sym
      parse_type
    end

    def image_path
      case to_sym
      when :dirt
        @image_path ||= 'assets/dirt.png'
      end
    end

    def has_image?
      !image_path.nil?
    end

    def hex_color
      case to_sym
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

  private

    def parse_type
      case @raw_type
      when 'G'
        @type ||= :grass
      when 'W'
        @type ||= :water
      when 'D'
        @type ||= :dirt
      when 'T'
        @type ||= :tree
      else
        raise UnknownMapTileTypeError
      end
    end
  end

  class UnknownMapTileTypeError < Exception
  end
end
