# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  credit_card_id :integer          not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_favorites_on_credit_card_id  (credit_card_id)
#  index_favorites_on_user_id         (user_id)
#
# Foreign Keys
#
#  credit_card_id  (credit_card_id => credit_cards.id)
#  user_id         (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :credit_card
  belongs_to :user

  validates :credit_card_id, uniqueness: { scope: :user_id }
end
