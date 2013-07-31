class ProjectionsController < ApplicationController
  # GET /projections
  # GET /projections.json
  def index
    # check to see if the user has submitted a query. If query submitted, grab the variables and convert to 2-digit month
    if params[:date]
        if params[:date][:month].length == 2
            @month = params[:date][:month]
        else 
            @month = "0" + params[:date][:month]
        end
        @year = params[:date][:year]
    else
        time = Time.now
        @month = time.strftime("%m")
        @year = time.strftime("%Y")
    end
    @projections = Projection.where(:month => @month, :year => @year).all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projections }
    end
  end

  # GET /projections/1
  # GET /projections/1.json
  def show
    @projection = Projection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @projection }
    end
  end

  # GET /projections/new
  # GET /projections/new.json
  def new
    @projection = Projection.new
    @sub_accounts = SubAccount.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @projection }
    end
  end

  # GET /projections/1/edit
  def edit
    @projection = Projection.find(params[:id])
    @sub_accounts = SubAccount.all    
  end

  # POST /projections
  # POST /projections.json
  def create
    @projection = Projection.new(params[:projection])

    respond_to do |format|
      if @projection.save
        format.html { redirect_to @projection, notice: 'Projection was successfully created.' }
        format.json { render json: @projection, status: :created, location: @projection }
      else
        format.html { render action: "new" }
        format.json { render json: @projection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projections/1
  # PUT /projections/1.json
  def update
    @projection = Projection.find(params[:id])

    respond_to do |format|
      if @projection.update_attributes(params[:projection])
        format.html { redirect_to @projection, notice: 'Projection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @projection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projections/1
  # DELETE /projections/1.json
  def destroy
    @projection = Projection.find(params[:id])
    @projection.destroy

    respond_to do |format|
      format.html { redirect_to projections_url }
      format.json { head :no_content }
    end
  end
end
