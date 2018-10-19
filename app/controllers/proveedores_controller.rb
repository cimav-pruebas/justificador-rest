class ProveedoresController < ApplicationController


  def index
    @proveedores = Proveedor
              .select("pv01_clave as clave, pv01_rfc as rfc,
                       CONCAT(pv01_razon_comercial, ', ', pv01_nombre, ', ', pv01_titular) as razon_social,
                       pv01_contacto as contacto,
                       CONCAT(pv01_direccion, ', ', pv01_colonia, ', ', pv01_ciudad, ', ', pv01_codigo_postal) as domicilio,
                       CONCAT(pv01_telefono1, ', ', pv01_telefono_contacto) as telefono,
                       CONCAT(pv01_email, ', ', pv01_email60, ', ', pv01_email_contacto) as telefono")
                       .all

    render json: @proveedores
  end


end