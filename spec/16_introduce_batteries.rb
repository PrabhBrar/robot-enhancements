require 'spec_helper'

describe Battery do
  
  before :each do
    @battery = Battery.new
  end

  it "should be an item" do
    expect(@battery).to be_an(Item)
  end

  it "has name 'Batteries'" do
    expect(@battery.name).to eq("Batteries")
  end

  it "has 25 weight" do
    expect(@battery.weight).to eq(25)
  end

  describe "#recharge" do
    before :each do
      @robot = Robot.new
    end

    it "heals the robot's health 10pts" do
      expect(@robot).to receive(:recharge_shield).with(10)
      @battery.recharge(@robot)
    end
  end

end