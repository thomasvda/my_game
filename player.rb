class Player

  attr_accessor :window

  def initialize(game_window)
    @window = game_window
    @icon = Gosu::Image.new(@window, "images/spyfox.gif", true)
    @x = (@window.width / 2)
    @y = (@window.height - 127)
  end

  def draw
    @icon.draw(@x, @y, 3)
  end

  def move_left
    if @x < 1 
      @x = 0
    else
      @x = @x - 20   
    end
  end

  def move_right
    if @x > (@window.width - 125)
      @x = (@window.width - 124)
    else
      @x = @x + 20
    end
  end

  def move_up
    if @y < 1
      @y = 0
    else
      @y = @y - 15
    end
  end

  def move_down
    if @y > (@window.height - 127)
      @y = (@window.height - 126)
    else
      @y = @y + 15
    end
  end

  def hit_by?(lasers)

    lasers.any? {|laser| Gosu::distance((@x + 19),@y + 100, laser.x, laser.y) < 30 or
    Gosu::distance((@x + 29),@y + 45, laser.x, laser.y) < 25 or
    Gosu::distance((@x + 35),@y + 20, laser.x, laser.y) < 25 or
    Gosu::distance((@x + 45),@y + 20, laser.x, laser.y) < 25 or
    Gosu::distance((@x + 55),@y + 15, laser.x, laser.y) < 25 or
    Gosu::distance((@x + 65),@y + 15, laser.x, laser.y) < 25 or
    Gosu::distance((@x + 75),@y + 60, laser.x, laser.y) < 30 or
    Gosu::distance((@x + 85),@y + 60, laser.x, laser.y) < 30 or
    Gosu::distance((@x + 90),@y + 100, laser.x, laser.y) < 30}
  end
end

