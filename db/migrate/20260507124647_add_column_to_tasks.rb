class AddColumnToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :description, :text
    add_column :tasks, :date_of_completion, :date
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
