class CreateMonedas < ActiveRecord::Migration[5.1]
  def change
    create_table :monedas do |t|
      t.string :code
      t.string :nombre
      t.string :simbolo

      t.timestamps
    end
  end
end
