require 'robotController'

RSpec.describe RobotController do
    def robot
        @robot ||= RobotController.new
    end

    it 'Deberia devolver posición actual -> 2,3,N' do
        expect(robot.devolverPosicion(2,3,"N")).to match_array([2,3,"N"])
    end

    it 'Deberia devolver posición final con uno de a la Izquierda-> inicial 2,3,N + I final 1,3,O' do
        expect(robot.calcularPosicionFinal(2,3,"N","I")).to match_array([2,3,"O"])
    end

    it 'Deberia devolver posición final con uno de a la Derecha-> inicial 2,3,N + A final 3,3,E' do
        expect(robot.calcularPosicionFinal(2,3,"N","D")).to match_array([2,3,"E"])
    end

    it 'Deberia devolver posición final con uno de a Arriba-> inicial 2,3,N + A final 2,4,N' do
        expect(robot.calcularPosicionFinal(2,3,"N","A")).to match_array([2,4,"N"])
    end

    it 'Deberia devolver posición final con uno de a Arriba-> inicial 2,3,E + I final 2,3,N' do
        expect(robot.calcularPosicionFinal(2,3,"E","I")).to match_array([2,3,"N"])
    end

    it 'Deberia devolver posición final con uno de a Arriba-> inicial 2,3,N + AA final 2,5,N' do
        expect(robot.calcularPosicionFinal(2,3,"N","AA")).to match_array([2,5,"N"])
    end

    it 'Deberia devolver posición final con Secuencia-> inicial 2,3,N + DAI final 3,3,N' do
        expect(robot.calcularPosicionFinal(2,3,"N","DAI")).to match_array([3,3,"N"])
    end

    it 'Deberia devolver posición final con Secuencia-> inicial 2,3,E + DAIDDAIA final 2,4,N' do
        expect(robot.calcularPosicionFinal(2,3,"E","DAIDDAIA")).to match_array([1,1,"S"])
    end
end