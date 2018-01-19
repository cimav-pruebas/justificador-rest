class JustificacionesController < ApplicationController
  before_action :set_justificacion, only: [:show, :edit, :update, :destroy]

  # GET /justificaciones
  # GET /justificaciones.json
  def index
    @justificaciones = Justificacion.all
  end

  def all_by_id_empleado

    asistidos_ids = Asistente.where("asistente_id = #{params[:id]}").collect(&:empleado_id).join(',')
    @justificaciones = Justificacion.where("empleado_id =  #{params[:id]} or empleado_id in (#{asistidos_ids})")

  end

  # GET /justificaciones/1
  # GET /justificaciones/1.json
  def show
    @justificacion = Justificacion.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        filename = "#{@justificacion.autoriza.cuenta_cimav}_#{@justificacion.requisicion}.pdf"
        pdf = PdfJustificacion.new(@justificacion)
        pdf.render_file  "public/#{filename}"
        send_data pdf.render,
                  filename: filename,
                  type: 'application/pdf',
                  disposition: "inline"
        File.delete("public/#{filename}");
      end
    end
  end

  # GET /justificaciones/new
  def new
    @justificacion = Justificacion.new
  end

  # GET /justificaciones/1/edit
  def edit
  end

  # POST /justificaciones
  # POST /justificaciones.json
  def create
    @justificacion = Justificacion.new(justificacion_params)

    respond_to do |format|
      if @justificacion.save
        format.html { redirect_to @justificacion, notice: 'Justificacion was successfully created.' }
        format.json { render :show, status: :created, location: @justificacion }
      else
        format.html { render :new }
        format.json { render json: @justificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /justificaciones/1
  # PATCH/PUT /justificaciones/1.json
  def update
    respond_to do |format|

      if @justificacion.update(justificacion_params)
        format.html { redirect_to @justificacion, notice: 'Justificacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @justificacion }
      else
        format.html { render :edit }
        format.json { render json: @justificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /justificaciones/1
  # DELETE /justificaciones/1.json
  def destroy
    @justificacion.destroy
    respond_to do |format|
      format.html { redirect_to justificaciones_url, notice: 'Justificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_justificacion
      @justificacion = Justificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def justificacion_params
      params.require(:justificacion).permit(:empleado_id, :tipo_id, :empleado_elaboro_id, :empleado_autorizo_id, :moneda_id, :requisicion, :proyecto, :proveedor_uno, :proveedor_dos, :proveedor_tres, :bien_servicio, :subtotal, :iva, :importe,
                                            :condiciones_pago, :datosbanco, :razoncompra, :terminos_entrega, :plazo_entrega, :rfc, :curp, :telefono, :email, :fecha_inicio, :fecha_termino, :fecha_elaboracion, :descripcion,
                                            :monto_uno, :monto_dos, :monto_tres, :domicilio, :es_unico, :plazo, :num_pagos, :porcen_anticipo, :autoriza_cargo, :forma_pago, :num_dias_plazo, :motivo_seleccion, :es_nacional,
                                            :identificador)
    end
end
