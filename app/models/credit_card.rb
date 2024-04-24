# == Schema Information
#
# Table name: credit_cards
#
#  id         :integer          not null, primary key
#  annual_fee :integer
#  details    :string
#  image_url  :string
#  issuer     :string
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CreditCard < ApplicationRecord
  has_many :favorites
  has_many :rewards # needed for rails_admin
  has_many :categories, through: :rewards, source: :category


  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # THIS CALCULATES THE TOTAL CAHS BACK FOR ALL THE USERS TRANSACTIONS FOR ALL CREDIT CARDS
  def total_cash_back(user)
    total_cash_back = 0
    user_transactions = UserTransaction.where(owner_id: user.id)
    user_transactions.each do |transaction|
      category_id = transaction.category_id
      if reward = Reward.find_by(category_id: category_id, credit_card_id: self.id)
        percentage_back = reward.percentage_back
      else
        percentage_back = Reward.find_by(category_id: Category.find_by(name: "All"), credit_card_id: self.id).percentage_back
      end
      cash_back = transaction.amount * (percentage_back / 100)
      total_cash_back += cash_back
    end
    return total_cash_back
  end


  # THIS CALCULATES THE CASH BACK FOR AN INDIVIDUAL TRANSACTION THAT THE USER HAS FOR ALL THE CREDIT CARDS
    def total_cash_back_for_transaction(user_transaction)
    total_cash_back = 0
    category_id = user_transaction.category_id

    if reward = Reward.find_by(category_id: category_id, credit_card_id: self.id)
      percentage_back = reward.percentage_back
    else
      percentage_back = Reward.find_by(category_id: Category.find_by(name: "All"), credit_card_id: self.id).percentage_back
    end
    cash_back = user_transaction.amount * (percentage_back / 100)
    total_cash_back += cash_back

    return total_cash_back
  end


end
