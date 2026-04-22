class GameElement
  attr_accessor :name, :points

  def initialize(name, points = 0)
    @name = name
    @points = points
  end

  def to_s
    "#{@name} (#{@points})"
  end
end