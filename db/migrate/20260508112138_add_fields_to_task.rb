class AddFieldsToTask < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :priority, :string
    add_column :tasks, :boolean, :string
    add_column :tasks, :due_date, :date
  end
end
