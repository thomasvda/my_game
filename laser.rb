class Laser

  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/laser.png", true)
    reset!
  end

  def update
    if @y > @game_window.height
     reset!
    else
      @y = @y + 9 + rand(5)
    end
  end

  def draw
    @icon.draw(@x,@y,2)
  end

  def x
    (@x + (@icon.width/2))
  end

  def y
    (@y + @icon.height)
  end

  def reset!
    @x = rand(@game_window.width - 15)
    @y = -400 + rand(400)
  end

end
