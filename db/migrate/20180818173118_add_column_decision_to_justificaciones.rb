class AddColumnDecisionToJustificaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :justificaciones, :decision, :integer, :default=> 1
  end
end
