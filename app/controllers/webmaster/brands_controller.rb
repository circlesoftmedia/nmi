class Webmaster::BrandsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  layout 'webmaster'
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(params[:brand])
    respond_to do |format|
      if @brand.save
        format.html { redirect_to webmaster_brand_path(@brand), notice: 'Brand was successfully created.' }
        #format.json { render json: @webmaster_category, status: :created, location: @webmaster_category }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def show
     @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to webmaster_brand_path(@brand), notice: 'Brand was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @webmaster_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to webmaster_brands_url }
      format.json { head :no_content }
    end
  end

end
