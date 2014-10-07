
class PicturesController < ApplicationController
 def index
    @picture = Picture.all
  end

def create
    @picture = Picture.new(picture_name: params[:file])
    if @picture.save!
	  respond_to do |format|
	    format.json{ render :json => @picture }
	  end
    end
  end
  
end