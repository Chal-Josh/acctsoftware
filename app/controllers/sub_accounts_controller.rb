class SubAccountsController < ApplicationController
  # GET /sub_accounts
  # GET /sub_accounts.json
  def index
    @sub_accounts = SubAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sub_accounts }
    end
  end

  # GET /sub_accounts/1
  # GET /sub_accounts/1.json
  def show
    @sub_account = SubAccount.find(params[:id])
    @transaction = Transaction.new
    2.times do
        @transaction.transaction_items.build
    end
    @sub_accounts = SubAccount.all    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sub_account }
    end
  end

  # GET /sub_accounts/new
  # GET /sub_accounts/new.json
  def new
    @sub_account = SubAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub_account }
    end
  end

  # GET /sub_accounts/1/edit
  def edit
    @sub_account = SubAccount.find(params[:id])
    @account = @sub_account.account
  end

  # POST /sub_accounts
  # POST /sub_accounts.json
  def create
    @sub_account = SubAccount.new(params[:sub_account])

    respond_to do |format|
      if @sub_account.save
        format.html { redirect_to :back, notice: 'Sub account was successfully created.' }
        format.json { render json: @sub_account, status: :created, location: @sub_account }
      else
        format.html { render action: "new" }
        format.json { render json: @sub_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sub_accounts/1
  # PUT /sub_accounts/1.json
  def update
    @sub_account = SubAccount.find(params[:id])

    respond_to do |format|
      if @sub_account.update_attributes(params[:sub_account])
        format.html { redirect_to @sub_account.account, notice: 'Sub account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sub_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_accounts/1
  # DELETE /sub_accounts/1.json
  def destroy
    @sub_account = SubAccount.find(params[:id])
    @sub_account.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
