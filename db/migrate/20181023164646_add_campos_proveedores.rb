class AddCamposProveedores < ActiveRecord::Migration[5.1]
  def change
    add_column :justificaciones, :prov2_rfc, :string
    add_column :justificaciones, :prov3_rfc, :string

    add_column :justificaciones, :prov2_telefono, :string
    add_column :justificaciones, :prov3_telefono, :string

    add_column :justificaciones, :prov2_email, :string
    add_column :justificaciones, :prov3_email, :string

    add_column :justificaciones, :prov2_domicilio, :string
    add_column :justificaciones, :prov3_domicilio, :string

    add_column :justificaciones, :prov2_banco, :string
    add_column :justificaciones, :prov3_banco, :string

    add_column :justificaciones, :prov1_contacto, :string
    add_column :justificaciones, :prov2_contacto, :string
    add_column :justificaciones, :prov3_contacto, :string
  end
end
