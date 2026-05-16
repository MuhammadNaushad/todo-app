class AddUserIdToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :user_id, :int
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
