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
  
  has_many :categories, through: :rewards, source: :category

end
