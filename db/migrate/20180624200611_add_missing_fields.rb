class AddMissingFields < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :section, :string # bloque
    add_column :properties, :apartment, :string # departamento
    add_column :properties, :floor, :string  # piso
    add_column :properties, :rooms, :string
  end
end
