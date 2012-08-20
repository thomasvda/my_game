class Candy

  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/candy.gif", true)
    @x = rand(@game_window.width)
    @y = -6000
  end

  def update
    if @y > @game_window.height
      reset_candy!
    else
    @y = @y + 14
    end
  end

  def draw
    @icon.draw(@x, @y, 2)
  end

  def reset_candy!
    @x = rand(@game_window.width - 50)
    @y = -2000 - rand(3000)
  end
end
