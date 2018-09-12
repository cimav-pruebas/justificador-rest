class PdfMercado < Prawn::Document

  def initialize(justificacion)
    super()

    @justificacion =  justificacion

    #stroke_axis

    direccion_cimav = "Miguel de Cervantes 120, Complejo Industrial Chihuahua\nChihuahua, Chih. México. C.P. 31136"

    font 'Helvetica'

    image "public/logo-cimav.png", :at=>[bounds.left, bounds.top+2], :scale=>0.90

    move_down 10
    font 'Times-Roman'
    text 'Centro de Investigación en Materiales Avanzados S. C.', size: 17, style: :bold, align: :center

    stroke do
      move_down 8
      stroke_color 'b3b3b3'
      stroke_horizontal_rule
    end

    draw_text 'FECHA ELABORACIÓN:', size: 11, style: :bold, :at=>[220, 660]
    draw_text fecha(justificacion.fecha_elaboracion) , size: 12, style: :bold, :at=>[400, 660]
    stroke do
      move_down 8
      stroke_color 'b3b3b3'
      horizontal_line 350, bounds.right, :at=>658
    end

    draw_text 'ASUNTO: ESTUDIO DE MERCADO', size: 11, style: :bold, :at=>[300, 640]

    row=620
    draw_text :"No. Partida / CUCOP",  style: :bold,size: 11, :at=>[0,row-=14]
    move_down 74
    indent(10) do
      text "#{justificacion.partida.texto.upcase}",  size: 11
    end
    row = cursor
    draw_text :"No. Requisición",  style: :bold,size: 11, :at=>[0,row-=20]
    draw_text :"#{justificacion.requisicion}",  size: 11, :at=>[10,row-=14]
    draw_text :"Descripción",  style: :bold,size: 11, :at=>[0,row-=20]
    move_down 64
    indent(10) do
      text "#{justificacion.descripcion}",  size: 11, align: :justify
    end

    row = cursor

    draw_text "Proveedores",  style: :bold, size: 11, :at=>[20,row-=14]
    indent(10) do
      draw_text :"1) #{justificacion.proveedor_uno.upcase}",  style: :bold, size: 11, :at=>[20,row-=14]
      indent(10) do
        draw_text :"Precio:",  size: 11, :at=>[20,row-=14]
        draw_text :"#{monto_to_currency(justificacion.monto_uno)}",  size: 11, :at=>[56,row]
        draw_text :"Origen del bien:",  size: 11, :at=>[164,row]
        draw_text :"#{justificacion.prov1_nacional ? "Nacional" : "Extranjero"}",  size: 11, :at=>[238,row]
        draw_text :"Fuente de consulta:",  size: 11, :at=>[340,row]
        fuente = justificacion.prov1_fuente==0?"Internet":(justificacion.prov1_fuente==1?"Compranet":"Presencial")
        draw_text :"#{fuente}",  size: 11, :at=>[430,row]
        draw_text "Cumplimiento de condiciones técnicas:", size: 11, :at=>[20,row-=20]
        move_cursor_to row - 6
        indent(30) do text "#{justificacion.prov1_tecnicas}",  size: 11, align: :justify end
        move_down 5
        indent(20) do text "Cantidad que puede surtir:", size: 11 end
        indent(30) do text "#{justificacion.prov1_cantidad}",  size: 11,align: :justify end
      end
    end

    if !justificacion.es_unico
      indent(10) do
        row = cursor
        draw_text :"2) #{justificacion.proveedor_dos.upcase}",  style: :bold, size: 11, :at=>[20,row-=14]
        indent(10) do
          draw_text :"Precio:",  size: 11, :at=>[20,row-=14]
          draw_text :"#{monto_to_currency(justificacion.monto_dos)}",  size: 11, :at=>[56,row]
          draw_text :"Origen del bien:",  size: 11, :at=>[164,row]
          draw_text :"#{justificacion.prov2_nacional ? "Nacional" : "Extranjero"}",  size: 11, :at=>[238,row]
          draw_text :"Fuente de consulta:",  size: 11, :at=>[340,row]
          fuente = justificacion.prov2_fuente==0?"Internet":(justificacion.prov2_fuente==1?"Compranet":"Presencial")
          draw_text :"#{fuente}",  size: 11, :at=>[430,row]
          draw_text "Cumplimiento de condiciones técnicas:", size: 11, :at=>[20,row-=20]
          move_cursor_to row - 6
          indent(30) do text "#{justificacion.prov2_tecnicas}",  size: 11, align: :justify end
          move_down 5
          indent(20) do text "Cantidad que puede surtir:", size: 11 end
          indent(30) do text "#{justificacion.prov2_cantidad}",  size: 11,align: :justify end
        end

        row = cursor
        draw_text :"3) #{justificacion.proveedor_tres.upcase}",  style: :bold, size: 11, :at=>[20,row-=14]
        indent(10) do
          draw_text :"Precio:",  size: 11, :at=>[20,row-=14]
          draw_text :"#{monto_to_currency(justificacion.monto_tres)}",  size: 11, :at=>[56,row]
          draw_text :"Origen del bien:",  size: 11, :at=>[164,row]
          draw_text :"#{justificacion.prov3_nacional ? "Nacional" : "Extranjero"}",  size: 11, :at=>[238,row]
          draw_text :"Fuente de consulta:",  size: 11, :at=>[340,row]
          fuente = justificacion.prov3_fuente==0?"Internet":(justificacion.prov3_fuente==1?"Compranet":"Presencial")
          draw_text :"#{fuente}",  size: 11, :at=>[430,row]
          draw_text "Cumplimiento de condiciones técnicas:", size: 11, :at=>[20,row-=20]
          move_cursor_to row - 6
          indent(30) do text "#{justificacion.prov3_tecnicas}",  size: 11, align: :justify end
          move_down 5
          indent(20) do text "Cantidad que puede surtir:", size: 11 end
          indent(30) do text "#{justificacion.prov3_cantidad}",  size: 11,align: :justify end
        end
      end
    end

    move_down 30
    text "ELABORÓ", style: :bold, align: :center, size: 11, character_spacing: 0.30
    text justificacion.autoriza.nombre+"\n"+justificacion.autoriza_cargo.upcase, align: :center, size: 11, character_spacing: 0.30

    repeat :all do
      move_down 20
      bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        move_down 15
        text "FO-CON-05", :size => 8, align: :right
      end
    end


  end

  def fecha(_fecha)
    "#{_fecha.strftime('%d')} de #{get_month_name(_fecha.strftime('%m').to_i)} de #{_fecha.strftime('%Y')}"
  end

  def get_month_name(number)
    months = ["enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre"]
    name = months[number - 1]
    return name
  end

  def monto_to_currency(monto)
    ActionController::Base.helpers.number_to_currency(monto, :unit => @justificacion.moneda.simbolo) + " " +  @justificacion.moneda.code
  end

  def si_no(value)
    value ? 'Si' : 'No'
  end

end