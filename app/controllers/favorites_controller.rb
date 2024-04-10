class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show edit update destroy ]
  before_action {authorize (@favorite || Favorite)}

  # GET /favorites or /favorites.json
  def index
    @favorites = current_user.favorites
    authorize(policy_scope(@favorites))
    @user_transactions = UserTransaction.all
    @credit_cards = []
    @favorites.each do |favorite|
      @credit_cards.append(CreditCard.find_by(id: favorite.credit_card_id))
    end
    @credit_card_totals = {}
    @credit_cards.each do |credit_card|
      @credit_card_totals[credit_card.id] = credit_card.total_cash_back(current_user)
    end
  end

  # GET /favorites/1 or /favorites/1.json
  def show

  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites or /favorites.json
  def create
    @favorite = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to current_user_favorites_url(username: current_user.username), notice: "Credit Card was succesfully added to your favorites!" }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1 or /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to favorite_url(@favorite), notice: "Favorite was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to current_user_favorites_url(username: current_user.username), notice: "Credit Card was successfully removed from your favorites." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:credit_card_id, :user_id)
    end
end
