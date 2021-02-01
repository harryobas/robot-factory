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

    def remove_robot(robot_name)
        raise Robot::Factory::Error.new, "robot not found" unless robot_exist?(robot_name)
        robot = @factory_robots[robot_name]
        Robot::Factory::RobotController.hibernate_robot(robot)
    end

    def reset_robot(robot_name)
        raise Robot::Factory::Error.new, "robot not found" unless robot_exist?(robot_name)
        robot = @factory_robots[robot_name]
        Robot::Factory::RobotController.reset_robot(robot)
    end
    
    def get_robot(robot_name)
        robot = @factory_robots[robot_name]
        case !robot.name && robot.settings[:reset]
        when true
            Robot::Factory::RobotController.boot_reset_robot(robot)
            @factory_robots["#{robot.name}"] = factory_robots.delete robot_name
        when false
            if !robot.name && robot.settings[:hibernate]
                Robot::Factory::RobotController.boot_hibernate(robot)
                @factory_robots["#{robot.name}"] = factory_robots.delete robot_name
            else
                return robot
            end  
        end
    end

    private 
    def robot_exist?(robot_name)
        @factory_robots.keys.include?(robot_name)
    end


end