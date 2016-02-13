class Item

  attr_reader :name
  attr_reader :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end
  
end