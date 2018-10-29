class JustificacionesController < ApplicationController
  before_action :set_justificacion, only: [:show, :edit, :update, :destroy]

  # GET /justificaciones
  # GET /justificaciones.json
  def index
    @justificaciones = Justificacion.all
  end

  def all_by_id_empleado

    ids = Asistente.where("asistente_id = #{params[:id]}").collect(&:empleado_id).concat(Array(params[:id])).join(',')
    @justificaciones = Justificacion.where("empleado_id in (#{ids})").order(:requisicion)

  end

  def show_by_requisicion
    justificaciones = Justificacion.where("requisicion LIKE '%#{params[:requisicion]}%'")
    render json: justificaciones
  end

  # GET /justificaciones/1
  # GET /justificaciones/1.json
  def show
    @justificacion = Justificacion.find(params[:id])
    @justificacion.fecha_impresion = Date.today
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        filename = "#{@justificacion.autoriza.cuenta_cimav}_#{@justificacion.requisicion}.pdf"
        # if @justificacion.tipo.fraccion == 1 ||  @justificacion.tipo.fraccion == 7
        if @justificacion.tipo.fraccion == 7
          pdf = PdfDictamen.new(@justificacion)
        else
          pdf = PdfJustificacion.new(@justificacion)
        end
        pdf.render_file  "public/#{filename}"
        send_data pdf.render,
                  filename: filename,
                  type: 'application/pdf',
                  disposition: "inline"
        File.delete("public/#{filename}");
      end
    end
  end

  def cotizacion
    @justificacion = Justificacion.find(params[:id])
    respond_to do |format|
      format.pdf do
        filename = "Cotizacion_#{@justificacion.requisicion}.pdf"
        pdf = PdfCotizacion.new(@justificacion, params[:num_provee])
        pdf.render_file  "public/#{filename}"
        send_data pdf.render,
                  filename: filename,
                  type: 'application/pdf',
                  disposition: "inline"
        File.delete("public/#{filename}");
      end
    end
  end

  def mercado
    @justificacion = Justificacion.find(params[:id])
    respond_to do |format|
      format.pdf do
        filename = "Mercado_#{@justificacion.requisicion}.pdf"
        pdf = PdfMercado.new(@justificacion)
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
      if @justificacion.save!
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


  def proveedores

    # regresa todos los proveedores usados anteriormente por el empleado

    proveedores1 = Justificacion.select("proveedor_uno as name").where("empleado_id = #{params[:empleado_id]}").as_json(:except => :id)
    proveedores2 = Justificacion.select("proveedor_dos as name").where("empleado_id = #{params[:empleado_id]}").as_json(:except => :id)
    proveedores3 = Justificacion.select("proveedor_tres as name").where("empleado_id = #{params[:empleado_id]}").as_json(:except => :id)

    proveedores = proveedores1 + proveedores2 + proveedores3
    proveedores = proveedores.to_a.uniq

    render json: proveedores
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
                                            :identificador, :partida_id,
                                            :economica, :eficiencia_eficacia,
                                            :prov1_fuente, :prov2_fuente, :prov3_fuente,
                                            :prov1_tecnicas, :prov2_tecnicas, :prov3_tecnicas,
                                            :prov1_cantidad, :prov2_cantidad, :prov3_cantidad,
                                            :prov1_nacional, :prov2_nacional, :prov3_nacional, :fecha_impresion,
                                            :prov2_rfc, :prov3_rfc,
                                            :prov2_telefono, :prov3_telefono,
                                            :prov2_email, :prov3_email,
                                            :prov2_domicilio, :prov3_domicilio,
                                            :prov2_banco, :prov3_banco,
                                            :updated_at,
                                            :prov1_contacto, :prov2_contacto, :prov3_contacto


      )
    end

end
