class AddNullFalseForAllColumnsToPropertyTable < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :location, :string, null: false
    change_column :properties, :description, :text, null: false
    change_column :properties, :price, :integer, null: false
    change_column :properties, :image, :string, null: false
  end
end
