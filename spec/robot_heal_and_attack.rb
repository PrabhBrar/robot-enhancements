require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do

    it "doesn't increase health for a dead robot" do
      expect(@robot).to receive(:health).and_return(0)
      expect { @robot.heal! }.to raise_error(RobotAlreadyDeadError, "Dead robots cannot heal.")
    end

  end

  describe "#attack!" do

    it "doesn't wound other items" do
      item = BoxOfBolts.new
      expect { @robot.attack!(item) }.to raise_error(UnattackableEnemy, "Robot can attack other robots only, no other target can be attacked by a robot.")
    end

  end

end