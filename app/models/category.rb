# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  image_url  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  has_many :user_transactions
  has_many :credit_cards, through: :rewards, source: :credit_card


  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
