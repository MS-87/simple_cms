class CreateUsers < ActiveRecord::Migration


  def up
    create_table :users do |t|
      #long way to create column
      t.column "first_name", :string, :limit => 25

      #short way to create column
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      #the following two are special, rails recognizes these names and automatically updates them for us
      #t.datetime "created_at"
      #t.datetime "updated_at"
      #the short hand for the two above is t.timestamps, so it'll be included
      t.timestamps

      #no column for "id" primary key - 
      #rails automatically adds it, only need to specify it when we don't want it
      #add {:id => false}  in th create_table definition if we don't want it
    end
  end

  def down
  	drop_table :users
  end


end
