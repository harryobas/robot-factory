class Robot::Factory::RobotController

    class << self
        def boot_robot(robot)
            robot.name = generate_robot_name()
            robot.settings[:boot] = true
            robot
        end

        def hibernate_robot(robot)
            robot.name = nil
            robot.settings[:hibernate] = true
        end

        def reset_robot(robot)
            robot.name = nil
            robot.settings[:reset] = true
        end

        private 

        def generate_robot_name()
            "#{('A'..'Z').to_a.shuffle.last(3).join + (0..9).to_a.shuffle.first(3).join}"
        end
    end

end