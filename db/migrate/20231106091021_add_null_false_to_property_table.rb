class AddNullFalseToPropertyTable < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :name, :string, null: false
    change_column :properties, :type, :string, null: false
  end
end
