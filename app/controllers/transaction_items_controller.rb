class TransactionItemsController < ApplicationController
  # GET /transaction_items
  # GET /transaction_items.json
  def index
    @transaction_items = TransactionItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transaction_items }
    end
  end

  # GET /transaction_items/1
  # GET /transaction_items/1.json
  def show
    @transaction_item = TransactionItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction_item }
    end
  end

  # GET /transaction_items/new
  # GET /transaction_items/new.json
  def new
    @transaction_item = TransactionItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction_item }
    end
  end

  # GET /transaction_items/1/edit
  def edit
    @transaction_item = TransactionItem.find(params[:id])
  end

  # POST /transaction_items
  # POST /transaction_items.json
  def create
    @transaction_item = TransactionItem.new(params[:transaction_item])

    respond_to do |format|
      if @transaction_item.save
        format.html { redirect_to @transaction_item, notice: 'Transaction item was successfully created.' }
        format.json { render json: @transaction_item, status: :created, location: @transaction_item }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transaction_items/1
  # PUT /transaction_items/1.json
  def update
    @transaction_item = TransactionItem.find(params[:id])

    respond_to do |format|
      if @transaction_item.update_attributes(params[:transaction_item])
        format.html { redirect_to @transaction_item, notice: 'Transaction item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_items/1
  # DELETE /transaction_items/1.json
  def destroy
    @transaction_item = TransactionItem.find(params[:id])
    @transaction_item.destroy

    respond_to do |format|
      format.html { redirect_to transaction_items_url }
      format.json { head :no_content }
    end
  end
end
