require 'spec_helper'

describe Robot do
  
  before :each do
    @robot = Robot.new
  end

  it "should have 50 shield points" do
    expect(@robot.shield_points).to eq(50)
  end

  describe "#wound" do
     
    it "should first drain the shield" do
      @robot.wound(20)
      expect(@robot.health).to eq(100)
      expect(@robot.shield_points).to eq(30)
    end

    context "with robot without shield points" do
      before :each do
        @robot.wound(50)
      end

      it "should start affecting actual health when shield points equal to zero" do
        @robot.wound(20)
        expect(@robot.shield_points).to eq(0)
        expect(@robot.health).to eq(80)
      end
    end

    context "with damage more than 50" do
      before :each do
        @robot.wound(80)
      end

      it "should start affecting actual health when shield points equal to zero" do
        expect(@robot.shield_points).to eq(0)
        expect(@robot.health).to eq(70)
      end
    end

  end

end