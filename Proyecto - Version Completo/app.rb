require 'sinatra'
require './lib/robotController'

get '/' do
    erb:index
end

get '/nombrar' do
    @@nombre = params[:nombre]
    erb:createterrain
end
get '/volverTerreno' do
    erb:createspace
end
post '/establecerTerreno' do
    @@terrx = params[:terrx].to_i
    @@terry = params[:terry].to_i
    erb:createspace
end
post '/establecerInicio' do
    @robot = RobotController.new
    @ejex = params[:ejex].to_i
    @ejey = params[:ejey].to_i
    @orientation = params[:orientation]
    @instructions = params[:instructions].upcase
    @resp = @robot.calcularPosicionFinal(@ejex, @ejey, @orientation, @instructions)
    erb:tablero
end