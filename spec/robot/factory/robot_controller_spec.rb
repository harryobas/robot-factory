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
    end


end

