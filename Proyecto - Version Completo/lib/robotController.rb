class RobotController
    def initialize
        @arr = []
        @oriFin = ''
        @posFinal = []
        @trayectoria = []
        @aux = 0
        @length = 0
    end
    def devolverPosicion(x, y, orientation)
        @arr << x << y << orientation
        return @arr
    end
    def calcularTrayectoria(x,y,orientation, instructions)
        @trayectoria = []
        @trayectoria = devolverPosicion(x,y,orientation)
        for i in 0..instructions.length-1
            @aux = @aux + 3 
            if(@trayectoria[@aux-1] == "N")
                @trayectoria = movimientosNorte(@trayectoria[@aux-3] ,@trayectoria[@aux-2] ,instructions[i])
            end
            if(@trayectoria[@aux-1] == "E")
                @trayectoria = movimientosEste(@trayectoria[@aux-3] ,@trayectoria[@aux-2] ,instructions[i])
            end
            if(@trayectoria[@aux-1] == "O")
                @trayectoria = movimientosOeste(@trayectoria[@aux-3] ,@trayectoria[@aux-2] ,instructions[i])
            end
            if(@trayectoria[@aux-1] == "S")
                @trayectoria = movimientosSur(@trayectoria[@aux-3] ,@trayectoria[@aux-2] ,instructions[i])
            end 
        end
        return @trayectoria
    end
    def calcularPosicionFinal(x, y, orientation, instructions)
        @posFinal = []
        @trayectoria=[]
        @trayectoria = calcularTrayectoria(x,y,orientation,instructions)
        @length = @trayectoria.length
        @posFinal [0] = @trayectoria[@length-3]
        @posFinal [1] = @trayectoria[@length-2]
        @posFinal [2] = @trayectoria[@length-1]         
        return @posFinal
    end
    def movimientosNorte(x,y,instruction)
        if(instruction == "I")
            @oriFin = 'O'
        end
        if(instruction == "D")
            @oriFin = 'E'
        end
        if(instruction == "A")
            y = y+1
            @oriFin = 'N'
        end
        return devolverPosicion(x,y,@oriFin)
    end

    def movimientosEste(x,y,instruction)
        if(instruction == "I")
            @oriFin = 'N'
        end
        if(instruction == "D")
            @oriFin = 'S'
        end
        if(instruction == "A")
            x = x+1
            @oriFin = 'E'
        end
        return devolverPosicion(x,y,@oriFin)
    end

    def movimientosOeste(x,y,instruction)
        if(instruction == "I")
            @oriFin = 'S'
        end
        if(instruction == "D")
            @oriFin = 'N'
        end
        if(instruction == "A")
            x = x-1
            @oriFin = 'O'
        end
        return devolverPosicion(x,y,@oriFin)
    end

    def movimientosSur(x,y,instruction)
        if(instruction == "I")
            @oriFin = 'E'
        end
        if(instruction == "D")
            @oriFin = 'O'
        end
        if(instruction == "A")
            y = y-1
            @oriFin = 'S'
        end
        return devolverPosicion(x,y,@oriFin)
    end
end
