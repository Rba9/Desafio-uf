class UnitsController < ApplicationController

 def index
    @units = Unit.all
    render json: @units
  end

  def show
     @unit = Unit.find_by(fecha:Date.parse(params[:fecha]))
     Request.create(nombre: params[:client])

     if @unit
        render json: @unit
     else 
        render json: {message: "Dato no encontrado"}
     end
  end

  def create
    @request = Request.new(request_params)
    
    if @request.save
        render json: @request, status: :created, location: @request
    else
        render json: @request.errors, status: :unprocessable_entity
   end
  end

  private

  def request_params 
    params.require(:request).permit(:nombre)
   
   end

end