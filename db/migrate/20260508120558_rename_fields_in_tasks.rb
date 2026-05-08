class RenameFieldsInTasks < ActiveRecord::Migration[8.1]
  def change
    rename_column :tasks, :boolean, :is_completed
    change_column :tasks, :is_completed, :boolean, default: false
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
