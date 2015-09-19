class AdminUser < ActiveRecord::Base #this inheritance makes it ActiveRecord DB compatible

  #If our table gets re-named, we can do the below to tell the User class that
  #admin_users is the correct name. this is useful for legacy systems
  #self.table_name = "admin_users" #
  #However, you can re-name your class/model name completely
  
=begin
you don't have to define things like:
attr_accessor :first_name
or 
def last_name
	@last_name
end

since this all gets created by ActiveRecors Base since our table already has first_name
=end

  #simple m:m table
  has_and_belongs_to_many :pages

  #Rich m:m table
  has_many :section_edits

  #this is to let it know that section_edits is a rich joint not just a regular table
  #we go THROUGH section_edits
  has_many :sections, :through => :section_edits


end
