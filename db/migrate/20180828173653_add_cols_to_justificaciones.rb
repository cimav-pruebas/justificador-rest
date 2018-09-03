class AddColsToJustificaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :justificaciones, :economica, :boolean, :default=> true
    add_column :justificaciones, :eficiencia_eficacia, :integer, :default=> 0
    add_column :justificaciones, :prov1_tecnicas, :text
    add_column :justificaciones, :prov2_tecnicas, :text
    add_column :justificaciones, :prov3_tecnicas, :text
    add_column :justificaciones, :prov1_cantidad, :text
    add_column :justificaciones, :prov2_cantidad, :text
    add_column :justificaciones, :prov3_cantidad, :text
    add_column :justificaciones, :prov1_nacional, :boolean, :default=> true
    add_column :justificaciones, :prov2_nacional, :boolean, :default=> true
    add_column :justificaciones, :prov3_nacional, :boolean, :default=> true


    add_column :justificaciones, :prov1_fuente, :integer, :default=> 0
    add_column :justificaciones, :prov2_fuente, :integer, :default=> 2
    add_column :justificaciones, :prov3_fuente, :integer, :default=> 1

  end
end
