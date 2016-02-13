require_relative 'lib_helper'

class Robot

  MAX_WEIGHT = 250
  MAX_HEALTH = 100
  DEFAULT_ATTACK = 5
  ROBOT_RANGE = 1
  MAX_SHIELD_POINTS = 50

  attr_reader :position
  attr_reader :health
  attr_reader :items
  attr_reader :shield_points
  attr_accessor :equipped_weapon

  @@robots = []

  def initialize
    @position = [0, 0]
    @items = []
    @items_weight = 0
    @health = MAX_HEALTH
    @shield_points = MAX_SHIELD_POINTS
    @@robots << self
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    item.feed(self) if item.instance_of?(BoxOfBolts) && health <= 80
    unless reached_capacity?(item)
      self.equipped_weapon = item if item.kind_of? Weapon
      @items.push(item)
    end
  end

  def items_weight
    items.reduce(0) { |sum, item| sum + item.weight}
  end

  def recharge_shield(shield_boost)
    @shield_points += shield_boost
    @shield_points = MAX_SHIELD_POINTS if shield_points > MAX_SHIELD_POINTS
  end

  def wound(damage)
    if shield_points > 0
      @shield_points -= damage
    else
      @health -= damage
    end
    if shield_points < 0
      @health += shield_points
      @shield_points = 0
    end
    @health = 0 if health <= 0
  end

  def heal(health_boost)
    heal!
    @health += health_boost
    @health = MAX_HEALTH if health > MAX_HEALTH
  end

  def heal!
    raise RobotAlreadyDeadError, "Dead robots cannot heal." if health == 0
  end

  def attack(enemy)
    attack!(enemy)
    if enemy_in_range?(enemy)
      if equipped_weapon
        equipped_weapon.hit(enemy)
      else
        enemy.wound(DEFAULT_ATTACK)
      end
      if equipped_weapon.instance_of?(Grenade)
        unequip_weapon
      end
    end
  end

  def attack!(enemy) 
    raise UnattackableEnemy, "Robot can attack other robots only, no other target can be attacked by a robot." unless enemy.instance_of?(Robot)
  end

  def self.robot_tracker
    @@robots
  end

  def self.in_position(x, y)
    @@robots.select { |robot| robot.position == [x, y] }
  end

  private

    def reached_capacity?(item)
        items_weight + item.weight > MAX_WEIGHT
    end

    def enemy_in_range?(enemy)
      if equipped_weapon
        x_coordinates_range = (position[0]-equipped_weapon.range..position[0]+equipped_weapon.range)
        y_coordinates_range = (position[1]-equipped_weapon.range..position[1]+equipped_weapon.range)
      else
        x_coordinates_range = (position[0]-1..position[0]+1)
        y_coordinates_range = (position[1]-1..position[1]+1)
      end

      if x_coordinates_range.include?(enemy.position[0]) && y_coordinates_range.include?(enemy.position[1])
        true
      else
        false
      end
    end

    def unequip_weapon
      @items.delete_at(@items.index(equipped_weapon))
      self.equipped_weapon = nil
    end

end