class UserTransactionsController < ApplicationController
  before_action :set_user_transaction, only: %i[ show edit update destroy ]
  before_action {authorize (@user_transaction || UserTransaction) }



  # GET /user_transactions or /user_transactions.json
  def index
    @user_transactions = current_user.transactions
    authorize( policy_scope( @user_transactions ))
    @credit_cards = CreditCard.all
    @credit_card_totals = {}
    @credit_cards.each do |credit_card|
      @credit_card_totals[credit_card.id] = credit_card.total_cash_back
    end
  
  end

  # GET /user_transactions/1 or /user_transactions/1.json
  def show
    @credit_cards = CreditCard.all
    @credit_card_totals = {}
    @credit_cards.each do |credit_card|
      @credit_card_totals[credit_card.id] = credit_card.total_cash_back_for_transaction(@user_transaction)
    end
  end
  

  # GET /user_transactions/new
  def new
    @user_transaction = UserTransaction.new
  end

  # GET /user_transactions/1/edit
  def edit
  end

  # POST /user_transactions or /user_transactions.json
  def create
    @user_transaction = UserTransaction.new(user_transaction_params)

    respond_to do |format|
      if @user_transaction.save
        format.html { redirect_to user_transaction_url(@user_transaction), notice: "User transaction was successfully created." }
        format.json { render :show, status: :created, location: @user_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_transactions/1 or /user_transactions/1.json
  def update
    respond_to do |format|
      if @user_transaction.update(user_transaction_params)
        format.html { redirect_to user_transaction_url(@user_transaction), notice: "User transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @user_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_transactions/1 or /user_transactions/1.json
  def destroy
    @user_transaction.destroy

    respond_to do |format|
      format.html { redirect_to user_transactions_url, notice: "User transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_transaction
    @user_transaction = UserTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_transaction_params
    params.require(:user_transaction).permit(:category_id, :owner_id, :category_id, :amount, :description)
  end
end
