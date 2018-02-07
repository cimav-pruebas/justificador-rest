# coding=utf-8
import mysql.connector
from mysql.connector import errorcode
import psycopg2
import datetime

try:

    # jdbc:postgresql://10.0.4.40:5432/rh_production
    cnnFuenteRH = psycopg2.connect(
        user='rh_user',
        password='rh_1ser',
        host='10.0.4.40',
        #port='5432',
        dbname='rh_production')
    curFuenteRH = cnnFuenteRH.cursor()

    # Replicas para Cimav
    conxDestino = mysql.connector.connect(
        user='root',
        host='localhost',
        password='',
        database='justificador_development'
    )
    curDestino = conxDestino.cursor(buffered=True)

    #curDestino.execute("SELECT * from justificaciones;")
    #nDest = [i[0].encode("utf-8") for i in curDestino.description]

    # ALTER TABLE justificaciones MODIFY COLUMN telefono TEXT CHARACTER SET utf8 COLLATE utf8_general_ci;

    sql_fuente = """
        SELECT
          e1.consecutivo as empleado_id,
          j.id_tipo as tipo_id,
          ee.consecutivo as empleado_elaboro_id,
          ea.consecutivo as empleado_autorizo_id,
          j.requisicion, j.proyecto, j.proveedoruno as proveedor_uno,
          j.proveedordos as proveedor_dos, j.proveedortres as proveedor_tres, j.bienoservicio as bien_servicio, j.subtotal, j.iva, j.importe, j.condicionespago as condiciones_pago, j.datosbanco, j.razoncompra, j.terminosentrega
          as terminos_entrega, j.plazoentrega as plazo_entrega, j.rfc, j.curp, j.telefono, j.email, j.fecha_inicio, j.fecha_termino, j.fecha_elaboracion, j.descripcion, j.monto_uno, j.monto_dos, j.monto_tres, j.domicilio,
          (j.id_moneda+1) as moneda_id, j.es_unico, j.plazo, j.num_pagos, j.porcen_anticipo, j.autoriza_cargo, j.forma_pago, j.num_dias_plazo, j.motivo_seleccion, j.esnacional as es_nacional, now() as created_at, now() as updated_at,
          '',null
        from justificaciones j, empleados_copy e1, empleados_copy ea, empleados_copy ee
        WHERE j.id_empleado = e1.id and
              j.id_empleado_autorizo = ea.id and
              j.id_empleado_elaboro = ee.id"""

    curFuenteRH.execute(sql_fuente)
    #fRh = ','.join('?' for desc in curFuenteRH.description)
    #nRh = [i[0].encode("utf-8") for i in curFuenteRH.description]

    for justi in curFuenteRH.fetchall():
        row = ''
        print justi[0], justi[1], justi[2], justi[3], justi[4]
        for i in justi:
            if i is None:
                row = row + "null,"
            elif isinstance(i, datetime.date):
                row = row + "'" + i.strftime('%Y-%m-%d') + "',"
            elif isinstance(i, basestring):
                i = str(i).replace("'","''")
                row = row + "'" + i + "',"
            else:
                row = row + str(i) + ","
        row = row[:-1]
        #print row
        #break
        stmt = "insert into justificaciones values (default,{})".format(row)
        #print stmt

        ### curDestino.execute(stmt)

    curDestino.close()
    curFuenteRH.close()

    conxDestino.commit()

    cnnFuenteRH.close()
    conxDestino.close()

except mysql.connector.Error as e:
	print 'BigError> ', e

## Quedan huerfanas las de Paradela y servicios.adquisiciones
