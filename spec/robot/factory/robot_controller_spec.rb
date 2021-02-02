require 'spec_helper'

RSpec.describe Robot::Factory::RobotController do

    before(:each) do
        @robot = Robot::Factory::FactoryRobot.new
       
    end

    describe '.boot_robot' do
        it "boots an initialized robot" do
            Robot::Factory::RobotController.boot_robot(@robot)
            expect(@robot.settings[:boot]).to eq true
        end
        it "raises error when robot is already booted" do
            expect{2.times{Robot::Factory::RobotController.boot_robot(@robot)}
            }.to raise_error(Robot::Factory::Error, "robot is already in boot mode")
        end  
    end

    describe '.reset_robot' do 
        it "raises error when robot is not booted" do
            expect{Robot::Factory::RobotController.reset_robot(@robot)
            }.to raise_error(Robot::Factory::Error, "robot is not booted") 
        end 
        it "resets an initialized and booted robot" do
            Robot::Factory::RobotController.boot_robot(@robot)
            Robot::Factory::RobotController.reset_robot(@robot)

            expect(@robot.settings[:reset]).to eq true
        end
    end


end

