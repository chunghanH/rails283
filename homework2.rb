class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end 
end

# 人類玩家的類別
class Human < Player
  def get_gesture
    begin
      puts "please choose one of the following: R / P / S"
      input = gets.chomp.upcase
    end while !['R', 'P', 'S'].include?(input)
    input
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
    input = ['R', 'P', 'S'].shuffle!.last.upcase
  end
end

class RPS
  def initialize
    intro
    begin
      show_message
    end while continue? == 'Y'
  end 
	  
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "<The Game Rock, Paper, Scissors>"
    begin
      puts "Type Name:"
      @name = gets.chomp.capitalize
    end while @name.length == 0
  end

  def decide
    #邏輯判斷式    
    regex = /RS|SP|PR/
    choice = "#{@user_input}#{@com_input}"
    puts "#{@user.name}:#{@user_input} #{@com.name}:#{@com_input}"
    if choice =~ regex
      puts "#{@user.name} wins the game!!!" 
    elsif choice.reverse =~ regex
      puts "#{@com.name} wins the game!!!"  
    else
      puts 'Draw...'  
    end
  end

  def get_player_gestures
    #取得玩家和電腦兩個物件的
    @user = Human.new(@name)
    @com = Computer.new("Com")
    @user_input = @user.get_gesture
    @com_input = @com.get_gesture
  end

  def continue?
    #判斷玩家是否要繼續下一輪
    begin
      puts 'Play Again?: Y / N'
      continue = gets.chomp.upcase
    end while !['Y', 'N'].include?(continue)
    continue
  end

  def show_message
    #印出結果
    get_player_gestures
    decide
  end
end
# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new
