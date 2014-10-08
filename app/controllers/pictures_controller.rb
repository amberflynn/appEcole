
class PicturesController < ApplicationController

def create
    @picture = Picture.new(media_file_name: params[:file])
    if @picture.save!
	  respond_to do |format|
	    format.json{ render :json => @picture }
	  end
    end
  end
  
end