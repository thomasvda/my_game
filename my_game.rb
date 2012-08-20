require 'rubygems'
require 'gosu'
require 'player'
require 'laser'
require 'candy'

class MyGame < Gosu::Window
  def initialize  
    super(640, 480, false)
    @player = Player.new(self)
    @lasers = 4.times.map {Laser.new(self)}
    @candy = Candy.new(self)
    @running = true
    @spyfoxlogo = Gosu::Image.new(self, "images/spyfoxlogo.gif", true)
    @pause = false
    @font_pause = Gosu::Font.new(self, '', 24)
    @font_GAME_OVER = Gosu::Font.new(self, 'Arial', 70)
  end

  def button_down(id)
    if @running == true
      if id == Gosu::Button::KbP
        if @pause == false
          @pause = true
        else
          @pause = false
        end
      end
    end
  end

  def update
    if @pause == false
      if @running
        if button_down? Gosu::Button::KbLeft
          @player.move_left
        end
    
        if button_down? Gosu::Button::KbRight
          @player.move_right
        end
    
        if button_down? Gosu::Button::KbUp
          @player.move_up
        end
    
        if button_down? Gosu::Button::KbDown
          @player.move_down
        end 
   
        @lasers.each {|laser| laser.update}
        @candy.update
    
        if @player.hit_by? @lasers
          stop_game!
        end
      else
      #the game has currently stopped
        if
          button_down? Gosu::Button::KbEscape
          restart_game
        end 
      end
    end
  end


  def draw
    @player.draw
    @lasers.each {|laser| laser.draw}
    @spyfoxlogo.draw(-5, -50, 0)
    @candy.draw
    @font_pause.draw("Pause", 400, 360, 10) if @pause == true
    @font_GAME_OVER.draw("GAME OVER", (@player.window.width / 2), (@player.window.height / 2), 10) if @running == false
  end

  def stop_game!
    @running = false
  end

  def restart_game
    @running = true
    @lasers.each {|laser| laser.reset!}
    @candy.reset_candy!
  end
end

window = MyGame.new
window.show
