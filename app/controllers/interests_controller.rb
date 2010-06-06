class InterestsController < ApplicationController
  layout false

  def index
    @interest = Interest.new
  end
  
  def show
    @interest = Interest.find(params[:id])
  end
  
  def new
    @interest = Interest.new
  end
  
  def create
    @interest = Interest.new(params[:interest])
    email = params[:interest][:email]
    if @interest.save
      flash[:notice] = "Successfully added Email to Notify List"
      redirect_to interests_path
    else
      flash.now[:error] = "Email address does not appear to be valid!" unless email.blank?
      render :action => 'index'
    end
  end
  
  def edit
    @interest = Interest.find(params[:id])
  end
  
  def update
    @interest = Interest.find(params[:id])
    if @interest.update_attributes(params[:interest])
      flash[:notice] = "Successfully updated interest."
      redirect_to @interest
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    flash[:notice] = "Successfully destroyed interest."
    redirect_to interests_url
  end
end
