class AddNullFalseToInspectionTable < ActiveRecord::Migration[7.0]
  def change
    change_column :inspections, :inspection_date, :string, null: false
    change_column :inspections, :inspection_time, :string, null: false
  end
end
