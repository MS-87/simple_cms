class SectionEdit < ActiveRecord::Base

    #remember, here we have to name it editor since it makes more sense
    #we have to specify which class this is referring to, but also
    #which foreign key it's referring to since it's not editor_id (ruby would search by default)
	belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	belongs_to :section
end
