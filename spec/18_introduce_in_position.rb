# require 'spec_helper'

# describe Robot do

#   before :each do
#     @robot = Robot.new
#     @robot2 = Robot.new
#     @robot3 = Robot.new
#     @robot3.move_up
#     @robot2.move_left
#     @robot2.move_up
#   end

#   describe ".in_position" do

#     it "should keep track of all the robots created" do
#       expect(Robot.in_position(0, 0)).to eq([@robot])
#       expect(Robot.in_position(0, 1)).to eq([@robot3])
#       expect(Robot.in_position(-1, 1)).to eq([@robot2])
#     end

#   end

# end