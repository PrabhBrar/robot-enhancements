class Battery < Item

  SHIELD_POINTS_BOOST = 10

  def initialize
    super("Batteries", 25)
  end

  def recharge(robot)
    robot.recharge_shield(SHIELD_POINTS_BOOST)
  end

end