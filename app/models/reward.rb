# == Schema Information
#
# Table name: rewards
#
#  id              :integer          not null, primary key
#  percentage_back :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#  credit_card_id  :integer          not null
#
# Indexes
#
#  index_rewards_on_category_id     (category_id)
#  index_rewards_on_credit_card_id  (credit_card_id)
#
# Foreign Keys
#
#  category_id     (category_id => categories.id)
#  credit_card_id  (credit_card_id => credit_cards.id)
#
class Reward < ApplicationRecord
  belongs_to :category
  belongs_to :credit_card

  
  
end
