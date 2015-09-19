class Subject < ActiveRecord::Base

  #rails will automatically add has_one supplemental methods to subject
  #this will allow to call subject.page, where subject is the object created
  has_many :pages


  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  #we add subjects.position instead of just position to disimbiguate
  scope :sorted, lambda {order("subjects.position ASC")}
  scope :newest_first, lambda {order("subjects.created_at DESC")}
  
  # this will find query even if it's a substring
  # when search is called with a string it'll search with it
  # And even if part of the string is found, it'll return it
  # this uses the array method
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }



end
