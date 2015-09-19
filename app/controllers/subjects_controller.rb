class SubjectsController < ApplicationController
  
  layout "admin"


  def index
    #we created a scope that lets us call sorted in our model
    #scope :sorted, lambda {order("subjects.position ASC")}
    @subjects = Subject.sorted
  end

  def show
    #we can find the id being searched in the URL string by using params[:id[]
    @subject = Subject.find(params[:id])
  end

  def new
    #We don't need this, but a form helpwer will not complain if it doesn't find @subject.
    #So it's best practice to instantiate variable
    #This also allows us to set default values for our attributes
    #if left out form values will be blank
    #in this example our "visible" default is false
    @subject =  Subject.new({:name => "Default"})
  end

  def create
    #Instantiate a new object using form parameters (USING STRONG PARAMETERS) (this is for mass assignement permissions)
    #@subject = Subject.new(params.require(:subject).permit(:name, :position, :visible)) #params are what was filled in the fields from "new"
    #the above is a lot of code, so what most people do:
    #create a private method at the bottom of our controller called subject_params
    @subject = Subject.new(subject_params) 
    #Save the object
    if @subject.save
      #if save succeeds, redirect to index action
      flash[:notice] = "Subject created sucessfully."
      redirect_to(:action => 'index')
    else
      #if save fails, redisplay the form so user can fix problem
      #during a render, all parameters must be assigned here, the new action WON'T be called
      #this is rendering the view not the action, so this will keep the previous data
      #we don't need a template for create
      render('new')
    end
  end

  def edit
    #just needs to find it
    @subject = Subject.find(params[:id])
  end


  def update
    #Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    #Update the found attributes, also need to do strong parameters
    if @subject.update_attributes(subject_params) 
       #if save succeeds, send it to show, we can work with @subject.id immediatley
       #we could do params also
       flash[:notice] = "Subject updated sucessfully."
       redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end
  end

  def delete

    @subject = Subject.find(params[:id])
  end

  def destroy
    #we don't need instance variable, local variable is fine since we won't be sending it
    #also, we can daisy chian calls like below
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed sucessfully."
    redirect_to(:action => 'index')
  end

  private #this will not allow the below to be called as an action
    def subject_params
      # Same as using "params[:subject]", except that it
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end

end

