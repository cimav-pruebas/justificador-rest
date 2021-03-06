class PdfCotizacion < Prawn::Document

  def initialize(justificacion, num_provee)
    super()

    case num_provee.to_i
      when 1
        proveedor_selected = justificacion.proveedor_uno
        domicilio = justificacion.domicilio
      when 2
        proveedor_selected = justificacion.proveedor_dos
        domicilio = ""
      when 3
        proveedor_selected = justificacion.proveedor_tres
        domicilio = ""
      else
        proveedor_selected = "Desconocido"
        domicilio = ""
    end

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

    draw_text 'FECHA:', size: 11, style: :bold, :at=>[300, 660]
    draw_text fecha(justificacion.fecha_elaboracion) , size: 12, style: :bold, :at=>[400, 660]
    stroke do
      move_down 8
      stroke_color 'b3b3b3'
      horizontal_line 350, bounds.right, :at=>658
    end

    draw_text 'ASUNTO: SOLICITUD DE COTIZACIÓN', size: 11, style: :bold, :at=>[300, 640]

    draw_text :"A quien corresponda:", size: 11, :at=>[0,610]
    draw_text :"#{proveedor_selected}" , style: :bold, size: 11, :at=>[0, 595]
    draw_text :"#{domicilio}" , size: 11, :at=>[0, 580]

=begin
Por lo antes mencionado y con el objeto de conocer: a).- la existencia bienes, arrendamientos o servicios a requerir \f
en las condiciones que se indican; b).- posibles proveedores a nivel nacional o internacional; c).- el precio estimado \f
de lo requerido, y d).- la capacidad de cumplimiento de los requisitos de participación, nos permitimos solicitar su \f
valioso apoyo a efecto de proporcionarnos la cotización de los bienes y/o servicios y/o arrendamientos \f
descritos en el documento anexo (poner en el anexo la descripción con las especificaciones técnicas y requisitos de \f
calidad, cantidad y oportunidad del o los bienes, arrendamiento y/o servicios a contratar).
=end

    move_down 120
    txt = "El <b>Cimav</b>, como Centro de Investigación del Gobierno Federal, requiere para sus actividades de suministro, \f
arrendamiento y/o prestación de servicios, mismas que se encuentran reguladas por la Ley de Adquisiciones, Arrendamientos \f
y Servicios del Sector Público (LAASSP) y su Reglamento, obtener información para contratar bajo las mejores condiciones disponibles para el Estado.

En este sentido y en terminos de lo previsto en el artículo 2 fracción X de la LAASSP, su representada ha sido identificada \f
por este ente público, como un posible prestador de servicio y/o proveedor.

Por lo antes mencionado y con el objeto de conocer: a).- la existencia bienes, arrendamientos o servicios a requerir \f
en las condiciones que se indican; b).- posibles proveedores a nivel nacional o internacional; c).- el precio estimado \f
de lo requerido, y d).- la capacidad de cumplimiento de los requisitos de participación, nos permitimos solicitar su \f
valioso apoyo a efecto de proporcionarnos la cotización de los bienes y/o servicios y/o arrendamientos \f
descritos en la última hoja de este documento y/o en el o los documentos anexos.

Dicha cotización se requiere que la remita en documento de la empresa, debidamente firmada por persona facultada, \f
a la siguiente dirección:

<i>#{direccion_cimav}</i>

Y que sea dirigida a nombre de: <b>#{justificacion.elabora.nombre}</b>.

Mucho agradeceré que en su respuesta se incluya: <i>Lugar y fecha de cotización y vigencia de la misma.</i>

Para el caso de dudas, comentarios y/o aclaraciones, remitirlas al correo: <b>#{justificacion.elabora.cuenta_cimav}@cimav.edu.mx</b>

La fecha límite para presentar la cotización es el: <b>#{fecha(justificacion.fecha_termino)}</b>

Favor de enviar acuse de recibo de esta solicitud al correo electrónico a: <b>jorge.parra@cimav.edu.mx</b>

<b>NOTA</b>: Vencido el plazo de recepción de cotizaciones, el <b>Cimav</b> con fundamento en lo previsto en el artículo 26 de la LAASSP, \f
se definirá el procedimiento a seguir para la contratación, el cual puede ser: LICITACIÓN PÚBLICA, INVITACIÓN A CUANDO MENOS \f
TRES PERSONAS y/o ADJUDICACIÓN DIRECTA, mismo que se informará a las personas que presentaron su cotización.

Este documento no genera obligación alguna para el centro."

    txt = txt.gsub(/\f\n/, '')
    text txt,size: 11, :align=>:justify, :inline_format => true

    txt = "\n(Para efectos de control interno, en el caso de no recibir respuesta o manifestar un inconveniente o imposibilidad, se \f
procederá a hacer la anotación respectiva en nuestros registros, circunstancias que deberán ser consideradas al momento de definir el \f
tipo de procedimiento de contratación)"

    txt = txt.gsub(/\f\n/, '')
    text txt,size: 10, style: :italic,:align=>:justify


    start_new_page

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

    move_down 10
    txt = "PARA FORMULAR SU COTIZACIÓN, SE DEBERA CONSIDERAR LOS SIGUIENTES ASPECTOS:"
    text txt, style: :bold

    move_down 8
    txt = "Datos que en su caso, se deben proporcionar para que el destinatario de la solicitud conteste:"
    text txt, style: :bold

    move_down 8
    indent(20) do
      txt =
        "1.- Los datos de los bienes, arrendamientos o servicios a cotizar (mismos que se especifican en el anexo de la solicitud de cotización).

        2.- Condiciones de entrega:
        En una sola exhibición de _______días naturales posteriores a la recepción de la orden de surtimiento."

        text txt
    end
    indent(40) do
      txt =
          "o Entregas parciales con una vigencia máxima (fechas o plazo)
          o El lugar de entrega será:"
      text txt
    end
    stroke do
      stroke_color 'b3b3b3'
      horizontal_line 348, bounds.right, :at=>550
    end
    stroke do
      stroke_color 'b3b3b3'
      horizontal_line 165, bounds.right, :at=>536
    end

    indent(20) do
      txt ="
      3.- Considerar en su cotización que el pago es a los 20 días naturales posteriores a la entrega de la factura, previa entrega de los bienes o prestación de los servicios a satisfacción.

      4.- Señalar en su caso, el porcentaje del anticipo________

      5.- El porcentaje de garantía de cumplimiento será del ____%.

      6.- Penas convencionales por atraso en la entrega de bienes y/o servicios y Deducciones por incumplimiento parcial o deficiente serán del _____.
      El archivo adjunto de especificaciones técnicas se hace consistir en ___ fojas.

      7.- En su caso, los métodos de prueba que empleará el ente público para determinar el cumplimiento de las especificaciones solicitadas."

      text txt
    end
    indent(40) do
      txt =
          "o Normas que deben de cumplirse.
          o Registros Sanitarios o Permisos Especiales, en su caso."
      text txt
    end

    indent(20) do
      txt ="
      8.- Origen de los bienes (nacional o país de importación) y nacionalidad de los posibles proveedores.

      9.- En caso de bienes de importación la moneda en que cotiza ___________.

      10.- En caso de que el proceso de fabricación de los bienes requeridos sea superior a 60 días, señale el tiempo que correspondería a su producción.

      11.- En su caso, especificar si el costo incluye:"
      text txt
    end

    indent(40) do
      txt ="o Instalación.
          o Capacitación.
          o Puesta en marcha."
      text txt
    end

    indent(20) do
      txt = "
      12.- Otras garantías que se debe considerar, indicar el o los tipos de garantía, o de responsabilidad civil señalando su vigencia."
      text txt
    end

    repeat :all do
      move_down 20
      bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        move_down 15
        text "FO-CON-04", :size => 8, align: :right
      end
    end

    start_new_page

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

    move_down 20
    txt = "Descripción con las especificaciones técnicas y requisitos de calidad, cantidad y oportunidad del o los bienes, arrendamiento y/o servicios a contratar:"
    text txt,:align=>:justify

    move_down 20
    text "#{justificacion.descripcion}",:align=>:justify

  end

  def fecha(_fecha)
    "#{_fecha.strftime('%d')} de #{get_month_name(_fecha.strftime('%m').to_i)} de #{_fecha.strftime('%Y')}"
  end

  def get_month_name(number)
    months = ["enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre"]
    name = months[number - 1]
    return name
  end

end