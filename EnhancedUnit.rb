# EnhancedUnit.rb
require_relative 'Unit'

class EnhancedUnit < Unit
  attr_accessor :specialrule

  def initialize(name, points, specialrule=nil)
    super(name, points)
    @specialrule = specialrule
  end

  def to_s
    base = super
    @specialrule ? base + " special rule: #{@specialrule}" : base
  end
end
