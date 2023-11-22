class RenameTypeToHouseTypeInProperty < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :type, :house_type
  end
end
