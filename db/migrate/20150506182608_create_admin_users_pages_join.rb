class CreateAdminUsersPagesJoin < ActiveRecord::Migration

  def up
  	#default name at end appended _joins, but needs to be as below:
  	#also, since joint table, PRI ID has to be false
    create_table :admin_users_pages, :id => false do |t|
    	t.integer "admin_user_id"
    	t.integer "page_id"
    end
    #this adds an index across both elements
    add_index :admin_users_pages, ["admin_user_id", "page_id"]
  end

  def down
  	drop_table :admin_users_pages 
  end


end
