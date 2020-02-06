class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    #by default it will be false for every user
    #but it doesnt get included
    add_column :users, :admin, :boolean, default: false 
  end
end
