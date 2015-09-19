class AlterUsers < ActiveRecord::Migration

  def up
  	rename_table("users", "admin_users") ##THis is an example but bad idea
    #^ The above would change the table name, but not the model/class name
    #Rails will be harder to use
  	add_column("admin_users", "username", :string, :limit => 25, :after => "email")
  	#this will change the previously defined email column:
  	change_column("admin_users","email", :string, :limit => 100)
  	rename_column("admin_users", "password", "hashed_password")
  	#add index to fields that will be used as look-up, such as username
  	#as a rule add index to foreign keys, always
  	puts "*** Adding an index is next ***"
  	add_index("admin_users", "username") 
  end

  def down
  	#to revert everything, we need to put the above in reverse order, and make their tasks opposite
  	remove_index("admin_users", "username") 
  	rename_column("admin_users", "hashed_password", "password")
  	change_column("admin_users","email", :string, :default => "", :null => false) #back to old definition
  	remove_column("admin_users", "username")
  	rename_table("admin_users", "users")  	  	
  	

  end

end
