require 'robot/factory/robot_controller'
require 'robot/factory/factory_robot'
class Robot::Factory::ControlPanel
    attr_reader :factory_robots, :robot_controller
    def initialize()
        @factory_robots = {}
    end

    def add_robot(robot)
        robot = Robot::Factory::RobotController.boot_robot(robot)
        @factory_robots["#{robot.name}"] = robot 
    end
end