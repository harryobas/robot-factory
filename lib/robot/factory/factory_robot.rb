
class Robot::Factory::FactoryRobot
    attr_accessor :name, :settings
    def initialize()
        @name = nil
        @settings = {
            boot: false,
            initialized: true,
            reset: false, 
            hibernate: false
        }
    end
    
end