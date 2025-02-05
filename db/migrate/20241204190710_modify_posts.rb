class ModifyPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :title, if_exists: true
    change_column :posts, :body, :text, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
