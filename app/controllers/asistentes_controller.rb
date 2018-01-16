class AsistentesController < ApplicationController
  before_action :set_asistente, only: [:show, :edit, :update, :destroy]

  # GET /asistentes
  # GET /asistentes.json
  def index
    @asistentes = Asistente.all
  end

  # GET /asistentes/1
  # GET /asistentes/1.json
  def show
  end

  # GET /asistentes/new
  def new
    @asistente = Asistente.new
  end

  # GET /asistentes/1/edit
  def edit
  end

  # POST /asistentes
  # POST /asistentes.json
  def create
    @asistente = Asistente.new(asistente_params)

    respond_to do |format|
      if @asistente.save
        format.html { redirect_to @asistente, notice: 'Asistente was successfully created.' }
        format.json { render :show, status: :created, location: @asistente }
      else
        format.html { render :new }
        format.json { render json: @asistente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistentes/1
  # PATCH/PUT /asistentes/1.json
  def update
    respond_to do |format|
      if @asistente.update(asistente_params)
        format.html { redirect_to @asistente, notice: 'Asistente was successfully updated.' }
        format.json { render :show, status: :ok, location: @asistente }
      else
        format.html { render :edit }
        format.json { render json: @asistente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistentes/1
  # DELETE /asistentes/1.json
  def destroy
    @asistente.destroy
    respond_to do |format|
      format.html { redirect_to asistentes_url, notice: 'Asistente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistente
      @asistente = Asistente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistente_params
      params.require(:asistente).permit(:asistente, :asistente_id, :empleado_id)
    end
end
