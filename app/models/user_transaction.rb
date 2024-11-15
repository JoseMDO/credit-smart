# == Schema Information
#
# Table name: user_transactions
#
#  id          :integer          not null, primary key
#  amount      :decimal(, )
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  owner_id    :integer          not null
#
# Indexes
#
#  index_user_transactions_on_category_id  (category_id)
#  index_user_transactions_on_owner_id     (owner_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  owner_id     (owner_id => users.id)
#
class UserTransaction < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :category

  validates :amount, presence: true
  validates :description, presence: true



  def self.ransackable_attributes(auth_object = nil)
    ["description", "amount", "category"]
  end

  def to_s
    "#{description.truncate(10)}"
  end

  def to_s_full
    "#{description}"
  end


end
