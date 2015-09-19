class DemoController < ApplicationController
  
  layout 'application'
  
  def index
  	#if you specify  what to render, rails will overide the hello view with index view since you told it to 
  	#render that instead, you would do that with:
  	#render(:template => 'demo/hello')  #this is the full command
  	#render('hello') #this shorter version works, rails assumes we're in the demo directory


  end 

  def hello #this is an explicit action
  	#render('index')
    
    #instance variable, will be available to the view
    @array = [1,2,3,4,5]
    
    #params is a hash with indiffernet access, so both methods will work:
    @id = params['id'].to_i
    @page = params[:page].to_i



  end

  def other_hello
    #Since we are in the demo controller, it doesn't have to be specified:
    #this will just call the index action (not template, action!)
    redirect_to(:controller => 'demo', :action => 'index') 
  end

  def lynda
    redirect_to("http://lynda.com")
  end

  def text_helpers
    #nothing in here, it will just render our template
  end

  def escape_output
  end



end
