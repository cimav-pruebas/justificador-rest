# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171212182208) do

  create_table "asistentes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "asistente_id"
    t.bigint "empleado_id"
    t.index ["asistente_id"], name: "index_asistentes_on_asistente_id"
    t.index ["empleado_id"], name: "index_asistentes_on_empleado_id"
  end

  create_table "justificaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "empleado_id"
    t.bigint "tipo_id"
    t.integer "empleado_elaboro_id"
    t.integer "empleado_autorizo_id"
    t.string "requisicion"
    t.string "proyecto"
    t.string "proveedor_uno"
    t.string "proveedor_dos"
    t.string "proveedor_tres"
    t.integer "bien_servicio"
    t.decimal "subtotal", precision: 10, scale: 2
    t.decimal "iva", precision: 10, scale: 2
    t.decimal "importe", precision: 10, scale: 2
    t.text "condiciones_pago"
    t.string "datosbanco"
    t.text "razoncompra", collation: "utf8_general_ci"
    t.text "terminos_entrega", collation: "utf8_general_ci"
    t.string "plazo_entrega"
    t.string "rfc"
    t.string "curp"
    t.text "telefono", collation: "utf8_general_ci"
    t.string "email"
    t.date "fecha_inicio"
    t.date "fecha_termino"
    t.date "fecha_elaboracion"
    t.text "descripcion", collation: "utf8_general_ci"
    t.decimal "monto_uno", precision: 10, scale: 2
    t.decimal "monto_dos", precision: 10, scale: 2
    t.decimal "monto_tres", precision: 10, scale: 2
    t.text "domicilio", collation: "utf8_general_ci"
    t.bigint "moneda_id"
    t.boolean "es_unico"
    t.integer "plazo"
    t.integer "num_pagos"
    t.integer "porcen_anticipo"
    t.text "autoriza_cargo", collation: "utf8_general_ci"
    t.string "forma_pago"
    t.integer "num_dias_plazo"
    t.text "motivo_seleccion"
    t.boolean "es_nacional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moneda_id"], name: "index_justificaciones_on_moneda_id"
    t.index ["tipo_id"], name: "index_justificaciones_on_tipo_id"
  end

  create_table "monedas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.string "nombre"
    t.string "simbolo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.integer "fraccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "justificaciones", "monedas"
  add_foreign_key "justificaciones", "tipos"
end
