require 'spec_helper'

RSpec.describe Robot::Factory::RobotController do

    before(:each) do
        @robot = Robot::Factory::FactoryRobot.new
        Robot::Factory::RobotController.boot_robot(@robot)
    end

    describe '.boot_robot' do
        it "boots an initialized robot" do
            expect(@robot.name).not_to eq nil
            expect(@robot.settings[:boot]).to eq true
        end
        it "raises error when robot is already booted" do
            expect{ Robot::Factory::RobotController.boot_robot(@robot)
            }.to raise_error(Robot::Factory::Error, "robot is already in boot mode")
        end
    end


end

