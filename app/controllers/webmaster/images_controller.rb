class Webmaster::ImagesController < ApplicationController

	def delete_image
    @image = Image.find(params[:id])
    @images = Image.where(:product_token => @image.product_token).order("position")
    @image.destroy
    respond_to do |format|
      format.js 
    end
  end

  def upload_image
    @image = Image.create(params[:image])
    @images = Image.where(:product_token => @image.product_token).order("position")
  end 

  def sort
    params[:image].each_with_index do |id, index|
      Image.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end
