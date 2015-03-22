class Webmaster::CategoriesController < ApplicationController
 before_filter :authenticate_user!
 #before_filter :authorize_admin
 load_and_authorize_resource

 layout 'webmaster'

  # GET /webmaster/categories
  # GET /webmaster/categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
     # format.json { render json: @webmaster_categories }
    end
  end

  # GET /webmaster/categories/1
  # GET /webmaster/categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @webmaster_category }
    end
  end

  # GET /webmaster/categories/new
  # GET /webmaster/categories/new.json
  def new
    @category =  Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /webmaster/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /webmaster/categories
  # POST /webmaster/categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to webmaster_category_path(@category), notice: 'Category was successfully created.' }
        #format.json { render json: @webmaster_category, status: :created, location: @webmaster_category }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /webmaster/categories/1
  # PUT /webmaster/categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to webmaster_category_path(@category), notice: 'Category was successfully updated.' }
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
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to webmaster_categories_url }
      format.json { head :no_content }
    end
  end

  protected

  def authorize_admin
    authorize! :manage, :all
  end
end
