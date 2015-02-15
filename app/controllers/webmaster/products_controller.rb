class Webmaster::ProductsController < ApplicationController
  before_filter :authenticate_admin!
 layout 'webmaster'
 
  # GET /webmaster/categories
  # GET /webmaster/categories.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
     # format.json { render json: @webmaster_categories }
    end
  end

  # GET /webmaster/categories/1
  # GET /webmaster/categories/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @webmaster_category }
    end
  end

  # GET /webmaster/categories/new
  # GET /webmaster/categories/new.json
  def new
    @product =  Product.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @product }
    end
  end

  # GET /webmaster/categories/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /webmaster/categories
  # POST /webmaster/categories.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to webmaster_product_path(@product), notice: 'Product was successfully created.' }
        #format.json { render json: @webmaster_category, status: :created, location: @webmaster_category }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /webmaster/categories/1
  # PUT /webmaster/categories/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to webmaster_product_path(@product), notice: 'Product was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @webmaster_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webmaster/categories/1
  # DELETE /webmaster/categories/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to webmaster_products_url }
      format.json { head :no_content }
    end
  end
end
