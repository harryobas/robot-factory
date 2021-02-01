require 'spec_helper'

RSpec.describe Robot::Factory::ControlPanel do
    context "initialization" do 
        it "initializes with an empty dictionary of factory robots" do
            control_panel = Robot::Factory::ControlPanel.new
            expect(control_panel.factory_robots).to be_a Hash
            expect(control_panel.factory_robots.empty?).to eq true 
        end     
    end

    describe "#add_robot" do 
        it "puts a robot on the factory floor" do
            robot = Robot::Factory::FactoryRobot.new
            control_panel = Robot::Factory::ControlPanel.new
            control_panel.add_robot(robot)
            expect(control_panel.factory_robots.empty?).to eq false
            expect(robot.name).not_to eq nil 
        end
    end


        
end