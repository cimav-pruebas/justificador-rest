class ChangeFraccionToNumber < ActiveRecord::Migration[5.1]
  def change
    change_column(:tipos, :fraccion, :integer)
  end
end
