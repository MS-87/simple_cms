class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections
	#do not have to define the foreign key in model, it already exists in migration

    #It's weird to say that a page has many admin_users, that doesn't mean anything
    #what we mean is that a page has many editors
    #the below can override the default rails convention and use the word editors
    # but it'll look for the class AdminUser
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

  scope :sorted, lambda {order("pages.position ASC")}
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :newest_first, lambda { order("pages.created_at DESC")}
  
end
