class ShortlinksController < ApplicationController
  before_action :set_shortlink, only: [:redirect]
  
  def new
    @shortlink = Shortlink.new
  end
  
  def index
    @shortlinks = Shortlink.paginate(page:params[:page])
  end
  
  def redirect
    if @shortlink
      redirect_to @shortlink.longurl
    else
      flash[:error] = "This does not exist"
      redirect_to '/'
    end 
  end 
  
  def show
    @shortlink = Shortlink.find(params[:id])
    #debugger
  end
  
  def create
    @shortlink = Shortlink.new(shortlink_params)
    
    if @shortlink.save
      flash[:success] = "New Short Link has been generated"
      redirect_to root_path
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
      flash[:success] = "Short link updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def destroy
      Shortlink.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to root_path
  end
  
  private
    def shortlink_params
      params.require(:shortlink).permit(:shorturl, :longurl)
    end
    
    def set_shortlink
      @shortlink = Shortlink.find_by(shorturl: params[:shortlink])
    end 
end
