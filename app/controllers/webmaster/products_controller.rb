class Webmaster::ProductsController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource
 layout 'webmaster'


  # GET /webmaster/categories
  # GET /webmaster/categories.json
  def index
    if current_user.role == 'super_admin'
      @products = Product.all
    else
      @products = current_user.products
    end

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
    if @product.token.nil?
      @product.token = @product.generate_token
    end
    @images = Image.where(:product_token => @product.token).order("position")
    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @product }
    end
  end

  # GET /webmaster/categories/1/edit
  def edit
    @product = Product.find(params[:id])
    @images = @product.images.order('position')
  end

  # POST /webmaster/categories
  # POST /webmaster/categories.json
  def create
    @product = Product.new(params[:product])
    @images = Image.where(:product_token => params[:product][:token])
    respond_to do |format|
      if @product.save
        @images.each do |image|
          image.update_attributes(imageable_id: @product.id, imageable_type: @product.class.name)
        end
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
    @images = Image.where(:product_token => params[:product][:token])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        @images.each do |image|
          image.update_attributes(imageable_id: @product.id, imageable_type: @product.class.name)
        end
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

  def search_attribute_name
    @results =  ProductItem.where("name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.json
    end
  end
end
