class CurrentAccountsController < ApplicationController
  before_action :set_current_account, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /current_accounts or /current_accounts.json
  def index
    @current_accounts = CurrentAccount.all
    #@current_accounts = CurrentAccount.all.order('debit ASC')

    @current_accounts = @current_accounts.where(["user_account_id LIKE :filter", :filter => ("%" + params[:filter] + "%")]) unless params[:filter].blank?
    @current_accounts = @current_accounts.order(:user_account_id).page(params[:page] || 1)
  end

  # GET /current_accounts/1 or /current_accounts/1.json
  def show
  end

  # GET /current_accounts/new
  def new
    @current_account = CurrentAccount.new
  end

  # GET /current_accounts/1/edit
  def edit
  end

  # POST /current_accounts or /current_accounts.json
  def create
    @current_account = CurrentAccount.new(current_account_params)

    respond_to do |format|
      if @current_account.save
        format.html { redirect_to @current_account, notice: "Current account was successfully created." }
        format.json { render :show, status: :created, location: @current_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @current_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /current_accounts/1 or /current_accounts/1.json
  def update
    respond_to do |format|
      if @current_account.update(current_account_params)
        format.html { redirect_to @current_account, notice: "Current account was successfully updated." }
        format.json { render :show, status: :ok, location: @current_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @current_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /current_accounts/1 or /current_accounts/1.json
  def destroy
    @current_account.destroy
    respond_to do |format|
      format.html { redirect_to current_accounts_url, notice: "Current account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_account
      @current_account = CurrentAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def current_account_params
      params.require(:current_account).permit(:user_account_id, :date, :description, :debit, :credit)
     
    end

   

end
