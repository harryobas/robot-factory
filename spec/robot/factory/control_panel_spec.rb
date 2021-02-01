require 'spec_helper'

RSpec.describe Robot::Factory::ControlPanel do
    context "initialization" do 
        it "initializes with an empty dictionary of factory robots" do
            control_panel = Robot::Factory::ControlPanel.new
            expect(control_panel.factory_robots).to be_a Hash
            expect(control_panel.factory_robots.empty?).to eq true 
        end     
    end

    before(:each) do 
        @control_panel = Robot::Factory::ControlPanel.new
        @robot = Robot::Factory::FactoryRobot.new
        @control_panel.add_robot(@robot)
    end

    describe "#add_robot" do 
        it "puts a robot on the factory floor" do
            expect(@control_panel.factory_robots.empty?).to eq false
            expect(@robot.name).not_to eq nil 
        end
        it "puts robot in boot state" do
            expect(@robot.settings[:boot]).to eq true
        end    
    end

    describe "#remove_robot" do
        it "takes a robot off the factory floor" do
            @control_panel.remove_robot(@robot.name)
            expect(@robot.name).to eq nil
        end
        it "puts a robot in hibernate state" do
            @control_panel.remove_robot(@robot.name)
            expect(@robot.settings[:hibernate]).to eq true
        end
        it "raises error when robot is not found" do
            expect{@control_panel.remove_robot("AA333")
        }.to raise_error(Robot::Factory::Error, "robot not found")
        end
    end
    describe "#reset_robot" do
        it 'sets a robot to factory settings' do
            @control_panel.reset_robot(@robot.name)
            expect(@robot.name).to eq nil
        end 
        it "puts a robot in reset state" do 
            @control_panel.reset_robot(@robot.name)
            expect(@robot.settings[:reset]).to eq true 
        end
        it "raises error when robot is not found" do 
            expect{@control_panel.reset_robot("AA###%!")
        }.to raise_error(Robot::Factory::Error, "robot not found")
        end
    end
   
end