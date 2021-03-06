class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    @bs_categories = BsCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    @sub_account = SubAccount.new(params[:sub_account])
    @transaction_items = @account.transaction_items

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
    @bs_categories = BsCategory.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @bs_categories = BsCategory.all
    @account = Account.find(params[:id])

  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path(), notice: 'Account was successfully created.' }
        format.json { render json: @accounts, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    # check to see if account has any transaction items tied to it. Do not allow deletion if true.
    if @account.transaction_items.empty?
        @account.destroy
        respond_to do |format|
          format.html { redirect_to accounts_path(), notice: 'Account Deleted' }
          format.json { head :no_content }
        end
    else 
        respond_to do |format|
          format.html { redirect_to :back, alert: 'Could not be deleted. You must transfer all Transaction Items.' }
          format.json { head :no_content }
        end
    end
  end
end
