class Robot::Factory::RobotController

    class << self
        def boot_robot(robot)
            raise Robot::Factory::Error.new, "robot is already in boot state" unless bootable_robot?(robot)
            robot.name = generate_robot_name()
            robot.settings[:boot] = true
            robot
        end

        def hibernate_robot(robot)
            raise Robot::Factory::Error.new, "robot is not booted" unless hibernateable_robot?(robot)
            robot.name = nil
            robot.settings[:hibernate] = true
        end

        def reset_robot(robot)
            raise Robot::Factory::Error.new, "robot is not booted" unless resetable_robot?(robot)
            robot.name = nil
            robot.settings[:reset] = true   
        end

        def boot_reset_robot(robot)
            robot.name = generate_robot_name
            robot.settings[:reset] = false 
        end 

        def boot_hibernate_robot(robot)
            robot.name = generate_robot_name
            robot.settings[:hibernate] = false

        end

        private 

        def generate_robot_name()
            "#{('A'..'Z').to_a.shuffle.sample(2).join + (0..9).to_a.shuffle.sample(3).join}"
        end

        def bootable_robot?(robot)
            !robot.name && !robot.settings[:boot] && robot.settings[:initialized]
        end

        def hibernateable_robot?(robot)
            robot.name && robot.settings[:boot] && robot.settings[:initialized]
        end

        def resetable_robot?(robot)
            robot.name && robot.settings[:boot] && robot.settings[:initialized]
        end
    end

end