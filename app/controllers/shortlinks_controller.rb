class ShortlinksController < ApplicationController
  def new
    @shortlink = Shortlink.new
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
  
  private
    def shortlink_params
      params.require(:shortlink).permit(:shorturl, :longurl)
    end
end
