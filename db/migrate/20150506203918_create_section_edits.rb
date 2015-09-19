class CreateSectionEdits < ActiveRecord::Migration
  
  def up
    create_table :section_edits do |t|

      #Remmeber, this is another way to create a foreign key
      #it'll add the id tag after (ie section_id)
      t.references :admin_user
      t.references :section

      #add more richness to this table, summary of change will be stored here
      #this makes sense to belong here
      t.string :summary

      t.timestamps null: false
    end

    #but you still have to add the index
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

  def down  
	  drop_table :section_edits
  end


end
