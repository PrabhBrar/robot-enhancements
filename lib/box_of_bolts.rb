class BoxOfBolts < Item

  HEALTH_BOOST = 20

  def initialize
    super("Box of bolts", 25)
  end

  def feed(robot)
    robot.heal(HEALTH_BOOST)
  end

end