# app/services/credit_card_total_calculator.rb
class CreditCardTotals
  def initialize(user)
    @user = user
  end

  #Goes through each credit card to get total cash back for the user
  def get_all_transactions_totals
    credit_card_totals = {}
    CreditCard.all.each do |credit_card|
      credit_card_totals[credit_card.id] = credit_card.total_cash_back(@user)
    end
    return credit_card_totals
  end

  #Goes through each credit card to get the total cash back for individual transaction
  def get_individial_transaction_totals(user_transaction)
    credit_card_totals = {}
    CreditCard.all.each do |credit_card|
      credit_card_totals[credit_card.id] = credit_card.total_cash_back_for_transaction(user_transaction)
    end
    return credit_card_totals
  end
end
