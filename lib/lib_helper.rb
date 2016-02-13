# Tool for safely requiring files that might not exist yet.
def safe_require(file)
  require_relative file
rescue LoadError
  # ignore
end

# Safely require the files that are expected to be created.
safe_require 'item'
safe_require 'weapon'
safe_require 'box_of_bolts'
safe_require 'laser'
safe_require 'plasma_cannon'
safe_require 'robot_already_dead_error'
safe_require 'unattackable_enemy'
safe_require 'grenade'
safe_require 'battery'