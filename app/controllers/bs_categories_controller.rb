class BsCategoriesController < ApplicationController
  # GET /bs_categories
  # GET /bs_categories.json
  def index
    @bs_categories = BsCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bs_categories }
    end
  end

  # GET /bs_categories/1
  # GET /bs_categories/1.json
  def show
    @bs_category = BsCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bs_category }
    end
  end

  # GET /bs_categories/new
  # GET /bs_categories/new.json
  def new
    @bs_category = BsCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bs_category }
    end
  end

  # GET /bs_categories/1/edit
  def edit
    @bs_category = BsCategory.find(params[:id])
  end

  # POST /bs_categories
  # POST /bs_categories.json
  def create
    @bs_category = BsCategory.new(params[:bs_category])

    respond_to do |format|
      if @bs_category.save
        format.html { redirect_to @bs_category, notice: 'Bs category was successfully created.' }
        format.json { render json: @bs_category, status: :created, location: @bs_category }
      else
        format.html { render action: "new" }
        format.json { render json: @bs_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bs_categories/1
  # PUT /bs_categories/1.json
  def update
    @bs_category = BsCategory.find(params[:id])

    respond_to do |format|
      if @bs_category.update_attributes(params[:bs_category])
        format.html { redirect_to @bs_category, notice: 'Bs category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bs_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bs_categories/1
  # DELETE /bs_categories/1.json
  def destroy
    @bs_category = BsCategory.find(params[:id])
    @bs_category.destroy

    respond_to do |format|
      format.html { redirect_to bs_categories_url }
      format.json { head :no_content }
    end
  end
end
