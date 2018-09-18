class ShortlinksController < ApplicationController
  
  def new
    @shortlink = Shortlink.new
  end
  
  def index
    @shortlinks = Shortlink.all
  end 
  
  def show
    @shortlink = Shortlink.find(params[:id])
    #debugger
  end
  
  def create
    @shortlink = Shortlink.new(shortlink_params)
    
    if @shortlink.save
      flash[:success] = "New Short Link has been generated"
      redirect_to @shortlink
    else
      render 'new'
    end
  end
  
  def edit
    @shortlink = Shortlink.find(params[:id])
  end
  
  def update
    @shortlink = Shortlink.find(params[:id])
    if @shortlink.update_attributes(shortlink_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  
  private
    def shortlink_params
      params.require(:shortlink).permit(:shorturl, :longurl)
    end
    
    def set_shortlink
      @shortlink = Shortner.find(params[:id])
    end 
end
